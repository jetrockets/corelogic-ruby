require "dry-container"
require "dry-auto_inject"
require "ostruct"

require "corelogic/connection"
require "corelogic/authenticator"
require "corelogic/response_parser"
require "corelogic/property"
require "corelogic/version"

module Corelogic
  class << self
    def configure(options = {})
      options.each do |key, value|
        configuration.send(:[]=, key, value)
      end
      yield(configuration) if block_given?

      register!
    end

    def properties
      Corelogic::API::PropertiesRepository.new
    end

    private

    def register!
      connection = ::Corelogic::Connection.new
      authenticator = ::Corelogic::Authenticator.new(configuration.to_h)
      parser_class = ::Corelogic::ResponseParser
      container.register :authenticator, -> { authenticator }
      container.register :connection, -> { connection }
      container.register :response_parser, -> { parser_class }
    end
  end

  private

  @@container = ::Dry::Container.new

  AutoInject = ::Dry::AutoInject(@@container)

  def self.container
    @@container
  end

  def self.configuration
    @@configuration ||= ::OpenStruct.new
  end
end

require "corelogic/api/properties_repository"

