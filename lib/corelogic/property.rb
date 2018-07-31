require 'dry-initializer'

module Corelogic
  class Property
    extend Dry::Initializer

    option :corelogicPropertyId, as: :id
    option :compositePropertyId, as: :composite_id, optional: true
    option :streetAddress, proc(&:to_s), as: :street_address
    option :houseNumber, proc(&:to_s), as: :house_number, optional: true
    option :houseNumber2, proc(&:to_s), as: :house_number2, optional: true
    option :preDirection, proc(&:to_s), as: :pre_direction, optional: true
    option :streetName, proc(&:to_s), as: :street_name, optional: true
    option :streetSuffix, proc(&:to_s), as: :street_suffix, optional: true
    option :postDirection, proc(&:to_s), as: :post_direction, optional: true
    option :unitNumber, proc(&:to_s), as: :unit_number, optional: true
    option :city, proc(&:to_s), optional: true
    option :zipcode, proc(&:to_s), optional: true
    option :zip4, proc(&:to_s), optional: true
    option :state, proc(&:to_s), optional: true
    option :latitude, proc(&:to_f), optional: true
    option :longitude, proc(&:to_f), optional: true
    option :fipsCode, proc(&:to_s), as: :fips_code, optional: true
    option :parcelNumber, proc(&:to_s), as: :parcel_number, optional: true
    option :parcelSequence, proc(&:to_s), as: :parcel_sequence, optional: true
    option :carrierRoute, proc(&:to_s), as: :carrier_route, optional: true
    option :links, optional: true

    def self.search(options)
      Corelogic.properties.search(options)
    end

    def ownership
      @ownership ||= Corelogic.properties.ownership(self.id)
    end

    def building
      @building ||= Corelogic.properties.building(self.id)
    end

    def tax_assessment
      @tax_assessment ||= Corelogic.properties.tax_assessment(self.id)
    end

    def site
      @site ||= Corelogic.properties.site(self.id)
    end

    def location
      @location ||= Corelogic.properties.location(self.id)
    end

    def owner_transfer
      @owner_transfer ||= Corelogic.properties.owner_transfer(self.id)
    end

    def last_market_sale
      @last_market_sale ||= Corelogic.properties.last_market_sale(self.id)
    end

    def load_details
    end

  end
end