require 'dry-initializer'

module Corelogic
  class Property::Building
    extend Dry::Initializer

    option :corelogicPropertyId, proc(&:to_s),     as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s),     as: :composite_property_id, optional: true
    option :stories, proc(&:to_i),                 as: :stories, optional: true
    option :secondFloorArea, proc(&:to_i),         as: :second_floor_area, optional: true
    option :thirdFloorArea, proc(&:to_i),          as: :third_floor_area, optional: true
    option :aboveGradeArea, proc(&:to_i),          as: :above_grade_area, optional: true
    option :additionArea, proc(&:to_i),            as: :addition_area, optional: true
    option :airConditioning, proc(&:to_s),         as: :air_conditioning, optional: true
    option :attic, proc(&:to_s),                   as: :attic, optional: true
    option :mainArea, proc(&:to_i),                as: :main_area, optional: true
    option :basementArea, proc(&:to_i),            as: :basement_area, optional: true
    option :basementFinish, proc(&:to_s),          as: :basement_finish, optional: true
    option :basementType, proc(&:to_s),            as: :basement_type, optional: true
    option :fullBaths, proc(&:to_s),               as: :full_baths, optional: true
    option :halfBaths, proc(&:to_s),               as: :half_baths, optional: true
    option :bedrooms, proc(&:to_s),                as: :bedrooms, optional: true
    option :buildingComments, proc(&:to_s),        as: :building_comments, optional: true
    option :carportArea, proc(&:to_i),             as: :carport_area, optional: true
    option :condition, proc(&:to_s),               as: :condition, optional: true
    option :constructionType, proc(&:to_s),        as: :construction_type, optional: true
    option :exteriorWall, proc(&:to_s),            as: :exterior_wall, optional: true
    option :finishedBasementArea, proc(&:to_i),    as: :finished_basement_area, optional: true
    option :fireplace, proc(&:to_s),               as: :fireplace, optional: true
    option :fireplaceType, proc(&:to_s),           as: :fireplace_type, optional: true
    option :floorCoverCode, proc(&:to_s),          as: :floor_cover_code, optional: true
    option :flooring, proc(&:to_s),                as: :flooring, optional: true
    option :foundation, proc(&:to_s),              as: :foundation, optional: true
    option :garage2Area, proc(&:to_i),             as: :garage_2_area, optional: true
    option :garageArea, proc(&:to_i),              as: :garage_area, optional: true
    option :garageCapacity, proc(&:to_s),          as: :garage_capacity, optional: true
    option :grossArea, proc(&:to_i),               as: :gross_area, optional: true
    option :groundFloorArea, proc(&:to_i),         as: :ground_floor_area, optional: true
    option :heatingFuelCode, proc(&:to_s),         as: :heating_fuel_code, optional: true
    option :heatType, proc(&:to_s),                as: :heat_type, optional: true
    option :interiorWallCode, proc(&:to_s),        as: :interior_wall_code, optional: true
    option :livingArea, proc(&:to_i),              as: :living_area, optional: true
    option :otherImprovements, proc(&:to_s),       as: :other_improvements, optional: true
    option :otherRooms, proc(&:to_s),              as: :other_rooms, optional: true
    option :parcelComments, proc(&:to_s),          as: :parcel_comments, optional: true
    option :parcelFuel, proc(&:to_s),              as: :parcel_fuel, optional: true
    option :parkingSpaces, proc(&:to_s),           as: :parking_spaces, optional: true
    option :parkingType, proc(&:to_s),             as: :parking_type, optional: true
    option :patio1Area, proc(&:to_i),              as: :patio1_area, optional: true
    option :patioType, proc(&:to_s),               as: :patio_type, optional: true
    option :pool, proc(&:to_s),                    as: :pool, optional: true
    option :poolArea, proc(&:to_i),                as: :pool_area, optional: true
    option :porch1Area, proc(&:to_i),              as: :porch_1_area, optional: true
    option :porch2Area, proc(&:to_i),              as: :porch_2_area, optional: true
    option :porchCode, proc(&:to_s),               as: :porch_code, optional: true
    option :quality, proc(&:to_s),                 as: :quality, optional: true
    option :rentableArea, proc(&:to_i),            as: :rentable_area, optional: true
    option :roofFrameCode, proc(&:to_s),           as: :roof_frame_code, optional: true
    option :roofShapeCode, proc(&:to_s),           as: :roof_shape_code, optional: true
    option :roofMaterialType, proc(&:to_s),        as: :roof_material_type, optional: true
    option :roofTypeCode, proc(&:to_s),            as: :roof_type_code, optional: true
    option :style, proc(&:to_s),                   as: :style, optional: true
    option :totalBuildingArea, proc(&:to_i),       as: :total_building_area, optional: true
    option :totalAdjustedLivingArea, proc(&:to_i), as: :total_adjusted_living_area, optional: true
    option :totalBaths, proc(&:to_i),              as: :total_baths, optional: true
    option :totalBathFixtures, proc(&:to_i),       as: :total_bath_fixtures, optional: true
    option :totalRooms, proc(&:to_i),              as: :total_rooms, optional: true
    option :upperArea, proc(&:to_i),               as: :upper_area, optional: true
    option :yearBuilt, proc(&:to_i),               as: :year_built, optional: true
    option :effectiveYearBuilt, proc(&:to_i),      as: :effective_year_built, optional: true
    option :fireplaceCount, proc(&:to_i),          as: :fireplace_count, optional: true
    option :links, optional: true
  end
end