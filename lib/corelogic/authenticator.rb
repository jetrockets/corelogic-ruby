require 'http'
require 'dry-initializer'
require "corelogic/response_parser"

module Corelogic
  class Authenticator
    extend Dry::Initializer

    OAUTH_URL  = 'https://api-prod.corelogic.com/oauth/token'.freeze

    option :consumer_key
    option :consumer_secret

    def call(connection, options = {})
      options = options.dup
      options[:grant_type] ||= 'client_credentials'
      force = options.delete(:force) || false
      return connection if !force && connection.authenticated?

      response = HTTP.basic_auth(credentials).post(OAUTH_URL, params: options)
      token = Corelogic::ResponseParser.perform(response)[:access_token]
      connection.bearer_token = token
      connection
    end

    private

    def credentials
      {
        user: consumer_key,
        pass: consumer_secret
      }
    end
  end
end