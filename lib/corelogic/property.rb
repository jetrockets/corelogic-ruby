
require 'dry-initializer'

module Corelogic
  class Property
    extend Dry::Initializer

    option :corelogicPropertyId, as: :id
    option :compositePropertyId, as: :composite_id
    option :streetAddress, proc(&:to_s), as: :street_addresse
    option :houseNumber, proc(&:to_s), as: :house_number
    option :houseNumber2, proc(&:to_s), as: :house_number2
    option :preDirection, proc(&:to_s), as: :pre_direction
    option :streetName, proc(&:to_s), as: :street_name
    option :streetSuffix, proc(&:to_s), as: :street_suffix
    option :postDirection, proc(&:to_s), as: :post_direction
    option :unitNumber, proc(&:to_s), as: :unit_number
    option :city, proc(&:to_s)
    option :zipcode, proc(&:to_s)
    option :zip4, proc(&:to_s)
    option :state, proc(&:to_s)
    option :latitude, proc(&:to_f)
    option :longitude, proc(&:to_f)
    option :fipsCode, proc(&:to_s), as: :fips_code
    option :parcelNumber, proc(&:to_s), as: :parcel_number
    option :parcelSequence, proc(&:to_s), as: :parcel_sequence
    option :carrierRoute, proc(&:to_s), as: :carrier_route
    option :links

    def self.search(options)
      Corelogic.properties.search(options)
    end
  end
end