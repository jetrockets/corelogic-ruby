require "corelogic/response_parser"
require "corelogic/collection"
require "corelogic/property"
require "corelogic/property/ownership"
require "corelogic/property/building"
require "corelogic/property/tax_assessment"
require "corelogic/property/site"
require "corelogic/property/location"
require "corelogic/property/owner_transfer"
require "corelogic/property/last_market_sale"
require "corelogic/property/prior_sale"

module Corelogic
  module API
    class PropertiesRepository
      include Corelogic::AutoInject["connection"]
      include Corelogic::AutoInject["response_parser"]
      include Corelogic::AutoInject["authenticator"]

      SEARCH_PATH = 'property'

      def search(options = {})
        Corelogic::Collection.new(Corelogic::Property, perform_response(SEARCH_PATH, options))
      end

      def ownership(property_id)
        Property::Ownership.new(perform_response("property/#{property_id}/ownership"))
      end

      def building(property_id)
        Property::Building.new(perform_response("property/#{property_id}/building"))
      end

      def tax_assessment(property_id)
        Property::TaxAssessment.new(perform_response("property/#{property_id}/tax-assessment"))
      end

      def site(property_id)
        Property::Site.new(perform_response("property/#{property_id}/site"))
      end

      def location(property_id)
        Property::Location.new(perform_response("property/#{property_id}/location"))
      end

      def owner_transfer(property_id)
        Property::OwnerTransfer.new(perform_response("property/#{property_id}/owner-transfer"))
      end

      def last_market_sale(property_id)
        Property::LastMarketSale.new(perform_response("property/#{property_id}/last-market-sale"))
      end

      def prior_sale(property_id)
        Property::PriorSale.new(perform_response("property/#{property_id}/prior-sale"))
      end

      private

      def perform_response(path, options = {})
        try = 0
        begin
          try += 1
          response_parser.perform(perform_get(path, options))
        rescue Corelogic::Error::Unauthorized => e
          puts e.message
          if try < 2
            puts "Retry: #{try}" if ENV['RAILS_ENV'] && ENV['RAILS_ENV'] == 'development'
            perform_connection(true)
            retry
          end
        end
      end

      def perform_get(path, options = {})
        perform_connection.get(path, params: options)
      end

      def perform_connection(force = false)
        return authenticator.call(connection, force: true) if force
        return connection if connection.authenticated?
        authenticator.call(connection)
      end

    end
  end
end
