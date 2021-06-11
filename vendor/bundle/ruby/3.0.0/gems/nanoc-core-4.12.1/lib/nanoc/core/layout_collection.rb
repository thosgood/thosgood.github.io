# frozen_string_literal: true

module Nanoc
  module Core
    class LayoutCollection < IdentifiableCollection
      def initialize(config, objects = [])
        initialize_basic(config, objects, 'layouts')
      end

      def reference
        'layouts'
      end
    end
  end
end
