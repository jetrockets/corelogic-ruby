require 'corelogic/api/api'
require "corelogic/connection"

module Corelogic
  class Client
    include Corelogic::API

    attr_accessor :consumer_key, :consumer_secret
    attr_reader :connection

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    def connection
      @connection ||= ::Corelogic::Connection.new(credentials)
    end

    def credentials
      {
        client_id: consumer_key,
        client_secret: consumer_secret
      }
    end
  end
end