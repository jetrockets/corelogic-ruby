
require 'dry-initializer'
module Corelogic
  class Property
    extend Dry::Initializer

    option :corelogicPropertyId, as: :id
    option :compositePropertyId, as: :composite_id
    option :streetAddress, proc(&:to_s)
    option :houseNumber, proc(&:to_s)
    option :houseNumber2, proc(&:to_s)
    option :preDirection, proc(&:to_s)
    option :streetName, proc(&:to_s)
    option :streetSuffix, proc(&:to_s)
    option :postDirection, proc(&:to_s)
    option :unitNumber, proc(&:to_s)
    option :city, proc(&:to_s)
    option :zipcode, proc(&:to_s)
    option :zip4, proc(&:to_s)
    option :state, proc(&:to_s)
    option :latitude, proc(&:to_f)
    option :longitude, proc(&:to_f)
    option :fipsCode, proc(&:to_s)
    option :parcelNumber, proc(&:to_s)
    option :parcelSequence, proc(&:to_s)
    option :carrierRoute, proc(&:to_s)
    option :links
  end
end