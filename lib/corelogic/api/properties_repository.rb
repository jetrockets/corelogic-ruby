require "corelogic/response_parser"
require "corelogic/collection"
require "corelogic/property"
require "corelogic/property/ownership"

module Corelogic
  module API
    class PropertiesRepository
      include Corelogic::AutoInject["connection"]
      include Corelogic::AutoInject["response_parser"]
      include Corelogic::AutoInject["authenticator"]

      SEARCH_PATH = 'property'

      def search(options = {})
        Corelogic::Collection.new(Corelogic::Property, perform_get(SEARCH_PATH, options))
      end

      def ownership(property_id)
        path = "property/#{property_id}/ownership"
        Property::Ownership.new(perform_get(path))
      end

      private

      def perform_get(path, options = {})
        ret = 0
        begin
          ret += 1
          response_parser.perform(perform_connection.get(path, params: options))
        rescue Corelogic::Error::Unauthorized => e
          puts e.message
          if ret < 2
            puts "Retry: #{ret}"
            perform_connection(true)
            retry
          end
        end
      end

      def perform_connection(force = false)
        return authenticator.call(connection, force: true) if force
        connection.authenticated? ? connection : authenticator.call(connection)
      end

    end
  end
end
