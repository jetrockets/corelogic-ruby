require 'dry-initializer'

module Corelogic
  class Property::Location
    extend Dry::Initializer

    option :corelogicPropertyId, proc(&:to_s), as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s), as: :composite_property_id, optional: true
    option :alternateApn, proc(&:to_s), as: :alternate_apn, optional: true
    option :apn, proc(&:to_s), as: :apn, optional: true
    option :censusBlock, proc(&:to_s), as: :census_block, optional: true
    option :county, proc(&:to_s), as: :county, optional: true
    option :legalBlock, proc(&:to_s), as: :legal_block, optional: true
    option :legalDescription, proc(&:to_s), as: :legal_description, optional: true
    option :legalLot, proc(&:to_s), as: :legal_lot, optional: true
    option :legalBookPage, proc(&:to_s), as: :legal_book_page, optional: true
    option :mapReference1, proc(&:to_s), as: :map_reference1, optional: true
    option :mapReference2, proc(&:to_s), as: :map_reference2, optional: true
    option :marketArea, proc(&:to_s), as: :market_area, optional: true
    option :neighborhoodCode, proc(&:to_s), as: :neighborhood_code, optional: true
    option :state, proc(&:to_s), as: :state, optional: true
    option :schoolDistrict, proc(&:to_s), as: :school_district, optional: true
    option :subdivision, proc(&:to_s), as: :subdivision, optional: true
    option :township, proc(&:to_s), as: :township, optional: true
    option :townshipRangeSection, proc(&:to_s), as: :township_range_section, optional: true
    option :censusTract, proc(&:to_s), as: :census_tract, optional: true
    option :tractNumber, proc(&:to_s), as: :tract_number, optional: true
    option :schoolDistrictName, proc(&:to_s), as: :school_district_name, optional: true
    option :censusBlockGroup, proc(&:to_s), as: :census_block_group, optional: true
    option :municipalityName, proc(&:to_s), as: :municipality_name, optional: true
    option :neighborhood, proc(&:to_s), as: :neighborhood, optional: true
    option :links, optional: true
  end
end