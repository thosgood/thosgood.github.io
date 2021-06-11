# frozen_string_literal: true

module Nanoc
  module Core
    class ItemCollection < IdentifiableCollection
      def initialize(config, objects = [])
        initialize_basic(config, objects, 'items')
      end

      def reference
        'items'
      end
    end
  end
end
