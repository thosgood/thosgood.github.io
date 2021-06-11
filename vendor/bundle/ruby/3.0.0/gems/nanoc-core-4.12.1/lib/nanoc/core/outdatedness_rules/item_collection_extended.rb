# frozen_string_literal: true

module Nanoc
  module Core
    module OutdatednessRules
      class ItemCollectionExtended < Nanoc::Core::OutdatednessRule
        affects_props :raw_content

        contract Nanoc::Core::ItemCollection, C::Named['Nanoc::Core::OutdatednessChecker'] => C::Maybe[Nanoc::Core::OutdatednessReasons::Generic]
        def apply(_obj, outdatedness_checker)
          new_items = outdatedness_checker.dependency_store.new_items

          if new_items.any?
            Nanoc::Core::OutdatednessReasons::ItemCollectionExtended.new(new_items)
          end
        end
      end
    end
  end
end
