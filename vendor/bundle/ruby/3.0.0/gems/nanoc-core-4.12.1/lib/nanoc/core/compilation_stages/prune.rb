# frozen_string_literal: true

module Nanoc
  module Core
    module CompilationStages
      class Prune < Nanoc::Core::CompilationStage
        def initialize(config:, reps:)
          @config = config
          @reps = reps
        end

        def run
          if @config[:prune][:auto_prune]
            Nanoc::Core::Pruner.new(@config, @reps, exclude: prune_config_exclude).run
          end
        end

        private

        def prune_config
          @config[:prune] || {}
        end

        def prune_config_exclude
          prune_config[:exclude] || {}
        end
      end
    end
  end
end
