# frozen_string_literal: true

module Nanoc
  module Core
    class ViewContextForShell
      include Nanoc::Core::ContractsSupport

      attr_reader :items
      attr_reader :reps
      attr_reader :dependency_tracker

      contract C::KeywordArgs[
        items: Nanoc::Core::IdentifiableCollection,
        reps: Nanoc::Core::ItemRepRepo,
      ] => C::Any
      def initialize(items:, reps:)
        @items = items
        @reps = reps

        @dependency_tracker = Nanoc::Core::DependencyTracker::Null.new
      end
    end
  end
end
