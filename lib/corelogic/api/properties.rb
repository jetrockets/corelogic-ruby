require "corelogic/response_parser"
require "corelogic/collection"

module Corelogic
  module API
    module Properties

      def search(options = {})
        path = 'property'
        response = connection.get(path, params: options)
        Corelogic::Collection.new(Corelogic::Property, Corelogic::ResponseParser.perform(response))
      end

    end
  end
end
