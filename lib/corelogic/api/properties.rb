module Corelogic
  module API
    module Properties

      def search(options = {})
        path = 'property'
        response = connection.get(path, params: options)
        # TODO: Implement Responce Parser
        ::Corelogic::Property.new(response.parse['data'])
      end

    end
  end
end
