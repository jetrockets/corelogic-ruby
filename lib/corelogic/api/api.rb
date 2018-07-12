require_relative './oauth'
require_relative './properties'
require 'corelogic/property'

module Corelogic
  module API
    include Corelogic::API::OAuth
    include Corelogic::API::Properties
  end
end