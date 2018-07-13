require 'http'

module Corelogic
  class Connection
    attr_accessor :bearer_token

    def initialize(options = {})
      @bearer_token = options[:bearer_token]
    end

    BASE_PATH = 'https://api-prod.corelogic.com/'.freeze

    def post(path, params = {})
      HTTP.auth(bearer_auth_header).post(url(path), params)
    end

    def get(path, params = {})
      HTTP.auth(bearer_auth_header).get(url(path), params)
    end

    def authenticated?
      !(bearer_token.nil? || bearer_token.empty?)
    end

    private

    def bearer_auth_header
      "Bearer #{bearer_token}"
    end

    def url(path)
      URI.join(BASE_PATH, path)
    end
  end
end