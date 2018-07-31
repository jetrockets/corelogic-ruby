require 'dry-initializer'

module Corelogic
  class Property::LastMarketSale
    extend Dry::Initializer

    option :corelogicPropertyId, proc(&:to_s), as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s), as: :composite_property_id, optional: true
    option :firstMortgageAmount, proc(&:to_i), as: :first_mortgage_amount, optional: true
    option :firstMortgageLoanType, proc(&:to_s), as: :first_mortgage_loan_type, optional: true
    option :firstMortgageInterestRate, proc(&:to_f), as: :first_mortgage_interest_rate, optional: true
    option :firstMortgageInterestRateType, proc(&:to_s), as: :first_mortgage_interest_rate_type, optional: true
    option :secondMortgageAmount, proc(&:to_i), as: :second_mortgage_amount, optional: true
    option :secondMortgageAmountType, proc(&:to_s), as: :second_mortgage_amount_type, optional: true
    option :secondMortgageInterestRate, proc(&:to_f), as: :second_mortgage_interest_rate, optional: true
    option :secondMortgageInterestRateType, proc(&:to_s), as: :second_mortgage_interest_rate_type, optional: true
    option :actualSalePrice, proc(&:to_i), as: :actual_sale_price, optional: true
    option :cashDown, proc(&:to_s), as: :cash_down, optional: true
    option :deedType, proc(&:to_s), as: :deed_type, optional: true
    option :documentNumber, proc(&:to_s), as: :document_number, optional: true
    option :hawaiiCombinedSalePrice, proc(&:to_i), as: :hawaii_combined_sale_price, optional: true
    option :mortgageDocumentNumber, proc(&:to_s), as: :mortgage_document_number, optional: true
    option :firstMortgageLenderCode, proc(&:to_s), as: :first_mortgage_lender_code, optional: true
    option :altDocumentNumber, proc(&:to_s), as: :alt_document_number, optional: true
    option :altDocumentNumber2, proc(&:to_s), as: :alt_document_number2, optional: true
    option :partialInterest, proc(&:to_s), as: :partial_interest, optional: true
    option :ownerName1, proc(&:to_s), as: :owner_name1, optional: true
    option :ownerName2, proc(&:to_s), as: :owner_name2, optional: true
    option :pricePerSquareFoot, proc(&:to_f), as: :price_per_square_foot, optional: true
    option :recordingDate, proc(&:to_s), as: :recording_date, optional: true
    option :saleDate, proc(&:to_s), as: :sale_date, optional: true
    option :saleType, proc(&:to_s), as: :sale_type, optional: true
    option :multipleOrSplitCode, proc(&:to_s), as: :multiple_or_split_code, optional: true
    option :sellerName, proc(&:to_s), as: :seller_name, optional: true
    option :titleCompany, proc(&:to_s), as: :title_company, optional: true
    option :transferDocumentNumber, proc(&:to_s), as: :transfer_document_number, optional: true
    option :newConstruction, proc(&:to_s), as: :new_construction, optional: true
    option :salePrice, proc(&:to_i), as: :sale_price, optional: true
    option :lender, proc(&:to_s), as: :lender, optional: true
    option :links, optional: true
  end
end