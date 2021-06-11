# frozen_string_literal: true

module Nanoc
  module Core
    module OutdatednessRules
      class AttributesModified < Nanoc::Core::OutdatednessRule
        include Nanoc::Core::ContractsSupport

        affects_props :attributes, :compiled_content

        contract C::Or[Nanoc::Core::ItemRep, Nanoc::Core::Item, Nanoc::Core::Configuration, Nanoc::Core::Layout], C::Named['Nanoc::Core::OutdatednessChecker'] => C::Maybe[Nanoc::Core::OutdatednessReasons::Generic]
        def apply(obj, outdatedness_checker)
          case obj
          when Nanoc::Core::ItemRep
            apply(obj.item, outdatedness_checker)
          when Nanoc::Core::Item, Nanoc::Core::Layout, Nanoc::Core::Configuration
            if outdatedness_checker.checksum_store[obj] == outdatedness_checker.checksums.checksum_for(obj)
              return nil
            end

            old_checksums = outdatedness_checker.checksum_store.attributes_checksum_for(obj)
            unless old_checksums
              return Nanoc::Core::OutdatednessReasons::AttributesModified.new(true)
            end

            new_checksums = outdatedness_checker.checksums.attributes_checksum_for(obj)

            attributes = Set.new(old_checksums.keys) + Set.new(new_checksums.keys)
            changed_attributes = attributes.reject { |a| old_checksums[a] == new_checksums[a] }

            if changed_attributes.any?
              Nanoc::Core::OutdatednessReasons::AttributesModified.new(changed_attributes)
            end
          else
            raise ArgumentError
          end
        end
      end
    end
  end
end
