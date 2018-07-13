require "corelogic/response_parser"
require "corelogic/collection"
require "corelogic/property"

module Corelogic
  module API
    class PropertiesRepository
      include Corelogic::AutoInject["connection"]
      include Corelogic::AutoInject["response_parser"]
      include Corelogic::AutoInject["authenticator"]

      SEARCH_PATH = 'property'

      def search(options = {})
        response = perform_connection.get(SEARCH_PATH, params: options)
        Corelogic::Collection.new(Corelogic::Property, response_parser.perform(response))
      end

      private

      def perform_connection
        connection.authenticated? ? connection : authenticator.call(connection)
      end

    end
  end
end
