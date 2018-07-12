require 'http'

module Corelogic
  class Connection
    attr_accessor :client_id, :client_secret, :bearer_token

    def initialize(options = {})
      @client_id = options[:client_id]
      @client_secret = options[:client_secret]
      @bearer_token = options[:bearer_token]
    end

    BASE_PATH = 'https://api-prod.corelogic.com/'.freeze

    def post_basic_auth(path, params = {})
      HTTP.basic_auth(user: client_id, pass: client_secret).post(url(path), params)
    end

    def post(path, params = {})
      HTTP.auth(bearer_auth_header).post(url(path), params)
    end

    def get(path, params = {})
      HTTP.auth(bearer_auth_header).get(url(path), params)
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