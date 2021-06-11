# frozen_string_literal: true

module Nanoc
  module Core
    # Responsible for determining whether an item or a layout is outdated.
    #
    # @api private
    class OutdatednessChecker
      class Basic
        DDMemoize.activate(self)

        include Nanoc::Core::ContractsSupport

        Rules = Nanoc::Core::OutdatednessRules

        RULES_FOR_ITEM_REP =
          [
            Rules::RulesModified,
            Rules::ContentModified,
            Rules::AttributesModified,
            Rules::NotWritten,
            Rules::CodeSnippetsModified,
            Rules::UsesAlwaysOutdatedFilter,
          ].freeze

        RULES_FOR_LAYOUT =
          [
            Rules::RulesModified,
            Rules::ContentModified,
            Rules::AttributesModified,
            Rules::UsesAlwaysOutdatedFilter,
          ].freeze

        RULES_FOR_CONFIG =
          [
            Rules::AttributesModified,
          ].freeze

        RULES_FOR_ITEM_COLLECTION =
          [
            Rules::ItemCollectionExtended,
          ].freeze

        RULES_FOR_LAYOUT_COLLECTION =
          [
            Rules::LayoutCollectionExtended,
          ].freeze

        C_OBJ_MAYBE_REP = C::Or[Nanoc::Core::Item, Nanoc::Core::ItemRep, Nanoc::Core::Configuration, Nanoc::Core::Layout, Nanoc::Core::ItemCollection, Nanoc::Core::LayoutCollection]

        contract C::KeywordArgs[outdatedness_checker: OutdatednessChecker, reps: Nanoc::Core::ItemRepRepo] => C::Any
        def initialize(outdatedness_checker:, reps:)
          @outdatedness_checker = outdatedness_checker
          @reps = reps
        end

        contract C_OBJ_MAYBE_REP => C::Maybe[Nanoc::Core::OutdatednessStatus]
        memoized def outdatedness_status_for(obj)
          case obj
          when Nanoc::Core::ItemRep
            apply_rules(RULES_FOR_ITEM_REP, obj)
          when Nanoc::Core::Item
            apply_rules_multi(RULES_FOR_ITEM_REP, @reps[obj])
          when Nanoc::Core::Layout
            apply_rules(RULES_FOR_LAYOUT, obj)
          when Nanoc::Core::Configuration
            apply_rules(RULES_FOR_CONFIG, obj)
          when Nanoc::Core::ItemCollection
            apply_rules(RULES_FOR_ITEM_COLLECTION, obj)
          when Nanoc::Core::LayoutCollection
            apply_rules(RULES_FOR_LAYOUT_COLLECTION, obj)
          else
            raise Nanoc::Core::Errors::InternalInconsistency, "do not know how to check outdatedness of #{obj.inspect}"
          end
        end

        private

        contract C::ArrayOf[Class], C_OBJ_MAYBE_REP, Nanoc::Core::OutdatednessStatus => C::Maybe[Nanoc::Core::OutdatednessStatus]
        def apply_rules(rules, obj, status = Nanoc::Core::OutdatednessStatus.new)
          rules.inject(status) do |acc, rule|
            if !acc.useful_to_apply?(rule)
              acc
            else
              reason = rule.instance.call(obj, @outdatedness_checker)
              if reason
                acc.update(reason)
              else
                acc
              end
            end
          end
        end

        contract C::ArrayOf[Class], C::ArrayOf[C_OBJ_MAYBE_REP] => C::Maybe[Nanoc::Core::OutdatednessStatus]
        def apply_rules_multi(rules, objs)
          objs.inject(Nanoc::Core::OutdatednessStatus.new) { |acc, elem| apply_rules(rules, elem, acc) }
        end
      end

      DDMemoize.activate(self)

      include Nanoc::Core::ContractsSupport

      attr_reader :checksum_store
      attr_reader :checksums
      attr_reader :dependency_store
      attr_reader :action_sequence_store
      attr_reader :action_sequences
      attr_reader :site

      Reasons = Nanoc::Core::OutdatednessReasons

      C_OBJ = C::Or[Nanoc::Core::Item, Nanoc::Core::ItemRep, Nanoc::Core::Configuration, Nanoc::Core::Layout, Nanoc::Core::ItemCollection]
      C_ITEM_OR_REP = C::Or[Nanoc::Core::Item, Nanoc::Core::ItemRep]
      C_ACTION_SEQUENCES = C::HashOf[C_OBJ => Nanoc::Core::ActionSequence]

      contract C::KeywordArgs[site: Nanoc::Core::Site, checksum_store: Nanoc::Core::ChecksumStore, checksums: Nanoc::Core::ChecksumCollection, dependency_store: Nanoc::Core::DependencyStore, action_sequence_store: Nanoc::Core::ActionSequenceStore, action_sequences: C_ACTION_SEQUENCES, reps: Nanoc::Core::ItemRepRepo] => C::Any
      def initialize(site:, checksum_store:, checksums:, dependency_store:, action_sequence_store:, action_sequences:, reps:)
        @site = site
        @checksum_store = checksum_store
        @checksums = checksums
        @dependency_store = dependency_store
        @action_sequence_store = action_sequence_store
        @action_sequences = action_sequences
        @reps = reps

        @objects_outdated_due_to_dependencies = {}
      end

      def action_sequence_for(rep)
        @action_sequences.fetch(rep)
      end

      contract C_OBJ => C::Bool
      def outdated?(obj)
        outdatedness_reasons_for(obj).any?
      end

      contract C_OBJ => C::IterOf[Reasons::Generic]
      def outdatedness_reasons_for(obj)
        reasons = basic.outdatedness_status_for(obj).reasons
        if reasons.any?
          reasons
        elsif outdated_due_to_dependencies?(obj)
          [Reasons::DependenciesOutdated]
        else
          []
        end
      end

      private

      contract C::None => Basic
      def basic
        @_basic ||= Basic.new(outdatedness_checker: self, reps: @reps)
      end

      contract C_OBJ, Hamster::Set => C::Bool
      def outdated_due_to_dependencies?(obj, processed = Hamster::Set.new)
        # Convert from rep to item if necessary
        obj = obj.item if obj.is_a?(Nanoc::Core::ItemRep)

        # Only items can have dependencies
        return false unless obj.is_a?(Nanoc::Core::Item)

        # Get from cache
        if @objects_outdated_due_to_dependencies.key?(obj)
          return @objects_outdated_due_to_dependencies[obj]
        end

        # Check processed
        # Don’t return true; the false will be or’ed into a true if there
        # really is a dependency that is causing outdatedness.
        return false if processed.include?(obj)

        # Calculate
        is_outdated = dependency_store.dependencies_causing_outdatedness_of(obj).any? do |dep|
          dependency_causes_outdatedness?(dep) ||
            (dep.props.compiled_content? &&
              outdated_due_to_dependencies?(dep.from, processed.merge([obj])))
        end

        # Cache
        @objects_outdated_due_to_dependencies[obj] = is_outdated

        # Done
        is_outdated
      end

      contract Nanoc::Core::Dependency => C::Bool
      def dependency_causes_outdatedness?(dependency)
        return true if dependency.from.nil?

        status = basic.outdatedness_status_for(dependency.from)

        active = status.props.active & dependency.props.active
        active.delete(:attributes) if attributes_unaffected?(status, dependency)
        active.delete(:raw_content) if raw_content_unaffected?(status, dependency)

        active.any?
      end

      def attributes_unaffected?(status, dependency)
        reason = status.reasons.find { |r| r.is_a?(Nanoc::Core::OutdatednessReasons::AttributesModified) }
        reason && dependency.props.attributes.is_a?(Enumerable) && (dependency.props.attributes & reason.attributes).empty?
      end

      def raw_content_unaffected?(status, dependency)
        reason = status.reasons.find { |r| r.is_a?(Nanoc::Core::OutdatednessReasons::DocumentCollectionExtended) }
        if reason.nil?
          false
        elsif !dependency.props.raw_content.is_a?(Enumerable)
          false
        else
          patterns = dependency.props.raw_content.map { |r| Nanoc::Core::Pattern.from(r) }
          patterns.none? { |pat| reason.objects.any? { |obj| pat.match?(obj.identifier) } }
        end
      end
    end
  end
end
