
module Corelogic
  module API
    module OAuth
      def token(options = {})
        options = options.dup
        options[:grant_type] ||= 'client_credentials'
        path = 'oauth/token'
        response = connection.post_basic_auth(path, params: options)

        response.parse(:json)['access_token']
      end
    end
  end
end