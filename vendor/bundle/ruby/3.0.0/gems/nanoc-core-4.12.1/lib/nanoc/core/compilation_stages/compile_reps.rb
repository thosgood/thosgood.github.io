# frozen_string_literal: true

module Nanoc
  module Core
    module CompilationStages
      class CompileReps < Nanoc::Core::CompilationStage
        include Nanoc::Core::ContractsSupport
        include Nanoc::Core::Assertions::Mixin

        def initialize(reps:, outdatedness_store:, dependency_store:, action_sequences:, compilation_context:, compiled_content_cache:)
          @reps = reps
          @outdatedness_store = outdatedness_store
          @dependency_store = dependency_store
          @action_sequences = action_sequences
          @compilation_context = compilation_context
          @compiled_content_cache = compiled_content_cache
        end

        def run
          outdated_reps = @reps.select { |r| @outdatedness_store.include?(r) }
          selector = Nanoc::Core::ItemRepSelector.new(outdated_reps)
          run_phase_stack do |phase_stack|
            selector.each do |rep|
              handle_errors_while(rep) do
                compile_rep(rep, phase_stack: phase_stack, is_outdated: @outdatedness_store.include?(rep))
              end
            end
          end

          assert Nanoc::Core::Assertions::AllItemRepsHaveCompiledContent.new(
            compiled_content_cache: @compiled_content_cache,
            item_reps: @reps,
          )
        ensure
          @outdatedness_store.store
          @compiled_content_cache.prune(items: @reps.map(&:item).uniq)
          @compiled_content_cache.store
        end

        private

        def handle_errors_while(item_rep)
          yield
        rescue Exception => e # rubocop:disable Lint/RescueException
          raise Nanoc::Core::Errors::CompilationError.new(e, item_rep)
        end

        def compile_rep(rep, phase_stack:, is_outdated:)
          phase_stack.call(rep, is_outdated: is_outdated)
        end

        def run_phase_stack
          phase_stack = build_phase_stack
          phase_stack.start
          yield(phase_stack)
        ensure
          phase_stack.stop
        end

        def build_phase_stack
          recalculate_phase = Nanoc::Core::CompilationPhases::Recalculate.new(
            action_sequences: @action_sequences,
            dependency_store: @dependency_store,
            compilation_context: @compilation_context,
          )

          cache_phase = Nanoc::Core::CompilationPhases::Cache.new(
            compiled_content_cache: @compiled_content_cache,
            compiled_content_store: @compilation_context.compiled_content_store,
            wrapped: recalculate_phase,
          )

          resume_phase = Nanoc::Core::CompilationPhases::Resume.new(
            wrapped: cache_phase,
          )

          write_phase = Nanoc::Core::CompilationPhases::Write.new(
            compiled_content_store: @compilation_context.compiled_content_store,
            wrapped: resume_phase,
          )

          mark_done_phase = Nanoc::Core::CompilationPhases::MarkDone.new(
            wrapped: write_phase,
            outdatedness_store: @outdatedness_store,
          )

          notify_phrase = Nanoc::Core::CompilationPhases::Notify.new(
            wrapped: mark_done_phase,
          )

          notify_phrase
        end
      end
    end
  end
end
