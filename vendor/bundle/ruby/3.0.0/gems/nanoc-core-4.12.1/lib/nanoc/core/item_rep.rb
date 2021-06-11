# frozen_string_literal: true

module Nanoc
  module Core
    class ItemRep
      include Nanoc::Core::ContractsSupport

      contract C::None => C::Bool
      attr_accessor :compiled
      alias compiled? compiled

      contract C::None => C::HashOf[Symbol => C::IterOf[String]]
      attr_reader :raw_paths

      contract C::None => C::HashOf[Symbol => C::IterOf[String]]
      attr_reader :paths

      contract C::None => Nanoc::Core::Item
      attr_reader :item

      contract C::None => Symbol
      attr_reader :name

      contract C::None => C::IterOf[C::Named['Nanoc::Core::SnapshotDef']]
      attr_accessor :snapshot_defs

      contract C::None => C::Bool
      attr_accessor :modified
      alias modified? modified

      contract Nanoc::Core::Item, Symbol => C::Any
      def initialize(item, name)
        # Set primary attributes
        @item   = item
        @name   = name

        # Set default attributes
        @raw_paths  = {}
        @paths      = {}
        @snapshot_defs = []

        # Reset flags
        @compiled = false
        @modified = false
      end

      contract C::HashOf[Symbol => C::IterOf[C::AbsolutePathString]] => C::HashOf[Symbol => C::IterOf[C::AbsolutePathString]]
      def raw_paths=(val)
        @raw_paths = val
      end

      contract C::HashOf[Symbol => C::IterOf[String]] => C::HashOf[Symbol => C::IterOf[String]]
      def paths=(val)
        @paths = val
      end

      contract Symbol => C::Bool
      def snapshot?(name)
        snapshot_defs.any? { |sd| sd.name == name }
      end

      contract C::KeywordArgs[snapshot: C::Optional[Symbol]] => C::Maybe[String]
      # Returns the item rep’s raw path. It includes the path to the output
      # directory and the full filename.
      def raw_path(snapshot: :last)
        @raw_paths.fetch(snapshot, []).first
      end

      contract C::KeywordArgs[snapshot: C::Optional[Symbol]] => C::Maybe[String]
      # Returns the item rep’s path, as used when being linked to. It starts
      # with a slash and it is relative to the output directory. It does not
      # include the path to the output directory. It will not include the
      # filename if the filename is an index filename.
      def path(snapshot: :last)
        @paths.fetch(snapshot, []).first
      end

      # Returns an object that can be used for uniquely identifying objects.
      def reference
        "item_rep:#{item.identifier}:#{name}"
      end

      def to_s
        "#{item.identifier} (rep name #{name.inspect})"
      end

      def inspect
        "<#{self.class} name=\"#{name}\" raw_path=\"#{raw_path}\" item.identifier=\"#{item.identifier}\">"
      end
    end
  end
end
