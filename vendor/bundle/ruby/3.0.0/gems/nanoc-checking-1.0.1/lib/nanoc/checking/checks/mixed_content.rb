# frozen_string_literal: true

module Nanoc
  module Checking
    module Checks
      # A check that verifies HTML files do not reference external resources with
      # URLs that would trigger "mixed content" warnings.
      #
      # @api private
      class MixedContent < ::Nanoc::Checking::Check
        identifier :mixed_content

        PROTOCOL_PATTERN = /^(\w+):\/\//.freeze

        def run
          filenames = output_html_filenames
          resource_uris_with_filenames = ::Nanoc::Extra::LinkCollector.new(filenames).filenames_per_resource_uri

          resource_uris_with_filenames.each_pair do |uri, fns|
            next unless guaranteed_insecure?(uri)

            fns.each do |filename|
              add_issue(
                "mixed content include: #{uri}",
                subject: filename,
              )
            end
          end
        end

        private

        def guaranteed_insecure?(href)
          protocol = PROTOCOL_PATTERN.match(href)

          protocol && protocol[1].casecmp('http').zero?
        end
      end
    end
  end
end
