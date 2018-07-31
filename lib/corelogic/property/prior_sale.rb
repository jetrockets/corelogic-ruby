require 'dry-initializer'

module Corelogic
  class Property::PriorSale
    extend Dry::Initializer

    option :corelogicPropertyId, proc(&:to_s), as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s), as: :composite_property_id, optional: true
    option :documentNumber, proc(&:to_s), as: :document_number, optional: true
    option :documentType, proc(&:to_s), as: :document_type, optional: true
    option :lenderNameCode, proc(&:to_s), as: :lender_name_code, optional: true
    option :saleDate, proc(&:to_s), as: :sale_date, optional: true
    option :salePrice, proc(&:to_i), as: :sale_price, optional: true
    option :saleTypeCode1, proc(&:to_s), as: :sale_type_code1, optional: true
    option :saleTypeCode2, proc(&:to_s), as: :sale_type_code2, optional: true
    option :stampAmount, proc(&:to_s), as: :stamp_amount, optional: true
    option :recordingDate, proc(&:to_s), as: :recording_date, optional: true
    option :firstMortgageAmount, proc(&:to_i), as: :first_mortgage_amount, optional: true
    option :firstMortgageType, proc(&:to_s), as: :first_mortgage_type, optional: true
    option :firstMortgageInterestRate, proc(&:to_f), as: :first_mortgage_interest_rate, optional: true
    option :firstMortgageInterestRateType, proc(&:to_s), as: :first_mortgage_interest_rate_type, optional: true
    option :links, optional: true
  end
end