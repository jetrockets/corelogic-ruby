require "corelogic/response_parser"
require "corelogic/collection"
require "corelogic/property"
require "corelogic/property/ownership"
require "corelogic/property/building"

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

      private

      def perform_response(path, options = {})
        try = 0
        begin
          try += 1
          response_parser.perform(perform_get(path, options))
        rescue Corelogic::Error::Unauthorized => e
          puts e.message
          if try < 2
            puts "Retry: #{try}"
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
