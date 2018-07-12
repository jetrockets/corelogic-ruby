require "corelogic/response_parser"

module Corelogic
  module API
    module Properties

      def search(options = {})
        path = 'property'
        response = connection.get(path, params: options)
        Corelogic::Property.new(Corelogic::ResponseParser.perform(response))
      end

    end
  end
end
