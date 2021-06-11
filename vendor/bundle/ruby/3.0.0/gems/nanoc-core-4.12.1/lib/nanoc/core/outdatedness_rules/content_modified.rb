# frozen_string_literal: true

module Nanoc
  module Core
    module OutdatednessRules
      class ContentModified < Nanoc::Core::OutdatednessRule
        affects_props :raw_content, :compiled_content

        def apply(obj, outdatedness_checker)
          obj = obj.item if obj.is_a?(Nanoc::Core::ItemRep)

          ch_old = outdatedness_checker.checksum_store.content_checksum_for(obj)
          ch_new = outdatedness_checker.checksums.content_checksum_for(obj)
          if ch_old != ch_new
            Nanoc::Core::OutdatednessReasons::ContentModified
          end
        end
      end
    end
  end
end
