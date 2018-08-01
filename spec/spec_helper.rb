require 'webmock/rspec'
require 'factory_bot'
require 'faker'
require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "corelogic"
require 'factory_bot/json_strategy'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.definition_file_paths = ['spec/factory_bot/factories']
    FactoryBot.find_definitions
    FactoryBot.register_strategy(:json, JsonStrategy)
  end
end

CONSUMER_KEY = 'your_client_id'.freeze
CONSUMER_SECRET = 'your_client_secret'.freeze

Corelogic.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
end

def a_get(path)
  a_request(:get, Corelogic::Connection::BASE_PATH + path)
end