require 'dry-initializer'

module Corelogic
  class Property::TaxAssessment
    extend Dry::Initializer

    option :corelogicPropertyId, proc(&:to_s), as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s), as: :composite_property_id, optional: true
    option :propertyTax, proc(&:to_s), as: :property_tax, optional: true
    option :totalAssessedValue, proc(&:to_s), as: :total_assessed_value, optional: true
    option :totalTaxableValue, proc(&:to_s), as: :total_taxable_value, optional: true
    option :landAssessment, proc(&:to_s), as: :land_assessment, optional: true
    option :improvementValue, proc(&:to_s), as: :improvement_value, optional: true
    option :marketValue, proc(&:to_s), as: :market_value, optional: true
    option :assessmentValue, proc(&:to_s), as: :assessment_value, optional: true
    option :taxYear, proc(&:to_s), as: :tax_year, optional: true
    option :equalizationRate, proc(&:to_s), as: :equalization_rate, optional: true
    option :delinquentYear, proc(&:to_s), as: :delinquent_year, optional: true
    option :taxAreaCode, proc(&:to_s), as: :tax_area_code, optional: true
    option :miscExemption, proc(&:to_s), as: :misc_exemption, optional: true
    option :seniorExemption, proc(&:to_s), as: :senior_exemption, optional: true
    option :disabledExemption, proc(&:to_s), as: :disabled_exemption, optional: true
    option :homesteadExemption, proc(&:to_s), as: :homestead_exemption, optional: true
    option :veteransExemption, proc(&:to_s), as: :veterans_exemption, optional: true
    option :widowExemption, proc(&:to_s), as: :widow_exemption, optional: true
    option :taxExemptAmount, proc(&:to_s), as: :tax_exempt_amount, optional: true
    option :fireDistrict, proc(&:to_s), as: :fire_district, optional: true
    option :garbageDistrict, proc(&:to_s), as: :garbage_district, optional: true
    option :lightUtilityDistrict, proc(&:to_s), as: :light_utility_district, optional: true
    option :sewerDistrict, proc(&:to_s), as: :sewer_district, optional: true
    option :waterDistrict, proc(&:to_s), as: :water_district, optional: true
    option :taxAppraisalDistrict, proc(&:to_s), as: :tax_appraisal_district, optional: true
    option :utilityDistrict, proc(&:to_s), as: :utility_district, optional: true
    option :communityCollegeDistrict, proc(&:to_s), as: :community_college_district, optional: true
    option :elementarySchoolDistrict, proc(&:to_s), as: :elementary_school_district, optional: true
    option :schoolDistrictName, proc(&:to_s), as: :school_district_name, optional: true
    option :sixthGradeSchoolDistrict, proc(&:to_s), as: :sixth_grade_school_district, optional: true
    option :middleSchoolDistrict, proc(&:to_s), as: :middle_school_district, optional: true
    option :highSchoolDistrict, proc(&:to_s), as: :high_school_district, optional: true
    option :localTaxDistrict, proc(&:to_s), as: :local_tax_district, optional: true
    option :improvedPercent, proc(&:to_s), as: :improved_percent, optional: true
    option :propertyTaxAmount, proc(&:to_s), as: :property_tax_amount, optional: true
    option :assessmentYear, proc(&:to_s), as: :assessment_year, optional: true
    option :schoolDistrictCode, proc(&:to_s), as: :school_district_code, optional: true
    option :taxExemptions, proc(&:to_s), as: :tax_exemptions, optional: true
    option :links, optional: true
  end
end