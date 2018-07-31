require 'dry-initializer'

module Corelogic
  class Property::Site
    extend Dry::Initializer

    option :corelogicPropertyId, proc(&:to_s), as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s), as: :composite_property_id, optional: true
    option :acres, proc(&:to_f), as: :acres, optional: true
    option :buildingClass, proc(&:to_s), as: :building_class, optional: true
    option :buildingDepth, proc(&:to_s), as: :building_depth, optional: true
    option :buildingWidth, proc(&:to_s), as: :building_width, optional: true
    option :commercialUnits, proc(&:to_s), as: :commercial_units, optional: true
    option :countyUseCode, proc(&:to_s), as: :county_use_code, optional: true
    option :landUse, proc(&:to_s), as: :land_use, optional: true
    option :lotSquareFeet, proc(&:to_i), as: :lot_square_feet, optional: true
    option :lotDepth, proc(&:to_s), as: :lot_depth, optional: true
    option :lotShape, proc(&:to_s), as: :lot_shape, optional: true
    option :lotWidth, proc(&:to_s), as: :lot_width, optional: true
    option :numberOfBuildings, proc(&:to_i), as: :number_of_buildings, optional: true
    option :residentialUnits, proc(&:to_i), as: :residential_units, optional: true
    option :sewerType, proc(&:to_s), as: :sewer_type, optional: true
    option :siteInfluence, proc(&:to_s), as: :site_influence, optional: true
    option :stateLandUse, proc(&:to_s), as: :state_land_use, optional: true
    option :topography, proc(&:to_s), as: :topography, optional: true
    option :usableLotArea, proc(&:to_s), as: :usable_lot_area, optional: true
    option :water, proc(&:to_s), as: :water, optional: true
    option :waterDistrict, proc(&:to_s), as: :water_district, optional: true
    option :zoning, proc(&:to_s), as: :zoning, optional: true
    option :stateLandUseCode, proc(&:to_s), as: :state_land_use_code, optional: true
    option :zoningCode, proc(&:to_s), as: :zoning_code, optional: true
    option :countyUse, proc(&:to_s), as: :county_use, optional: true
    option :links, optional: true
  end
end