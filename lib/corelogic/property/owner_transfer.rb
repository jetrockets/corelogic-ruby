require 'dry-initializer'

module Corelogic
  class Property::OwnerTransfer
    extend Dry::Initializer

    option :corelogicPropertyId, proc(&:to_s), as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s), as: :composite_property_id, optional: true
    option :recordingDate, proc(&:to_s), as: :recording_date, optional: true
    option :saleDate, proc(&:to_s), as: :sale_date, optional: true
    option :salePrice, proc(&:to_i), as: :sale_price, optional: true
    option :documentNumber, proc(&:to_s), as: :document_number, optional: true
    option :deedType, proc(&:to_s), as: :deed_type, optional: true
    option :firstMortgageDocumentNumber, proc(&:to_s), as: :first_mortgage_document_number, optional: true
    option :ownerName1, proc(&:to_s), as: :owner_name1, optional: true
    option :ownerName2, proc(&:to_s), as: :owner_name2, optional: true
    option :landCourtNumber, proc(&:to_s), as: :land_court_number, optional: true
    option :multiSplit, proc(&:to_s), as: :multi_split, optional: true
    option :partialInterest, proc(&:to_s), as: :partial_interest, optional: true
    option :nominalMortgageDocumentNumber, proc(&:to_s), as: :nominal_mortgage_document_number, optional: true
    option :links, optional: true
  end
end