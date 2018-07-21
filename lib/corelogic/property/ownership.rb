require 'dry-initializer'

module Corelogic
  class Property::Ownership
    extend Dry::Initializer
    option :corelogicPropertyId, proc(&:to_s), as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s), as: :composite_property_id, optional: true
    option :ownerName1, proc(&:to_s), as: :owner_name1
    option :ownerName2, proc(&:to_s), as: :owner_name2, optional: true
    option :vestingOwner1, proc(&:to_s), as: :vesting_owner1, optional: true
    option :vestingOwner2, proc(&:to_s), as: :vesting_owner2, optional: true
    option :vestingOwner3, proc(&:to_s), as: :vesting_owner3, optional: true
    option :vestingOwner4, proc(&:to_s), as: :vesting_owner4, optional: true
    option :mailingAddress, proc(&:to_s), as: :mailing_address, optional: true
    option :mailingCityState, proc(&:to_s), as: :mailing_city_state, optional: true
    option :mailingZip5, proc(&:to_s), as: :mailing_zip5, optional: true
    option :mailingZip4, proc(&:to_s), as: :mailing_zip4, optional: true
    option :mailingCarrierRoute, proc(&:to_s), as: :mailing_carrier_route, optional: true
    option :mailingCareOfName, proc(&:to_s), as: :mailing_care_of_name, optional: true
    option :phoneNumber, proc(&:to_s), as: :phone_number, optional: true
    option :vestingEtal, proc(&:to_s), as: :vesting_etal, optional: true
    option :vestingOwnershipRight, proc(&:to_s), as: :vesting_ownership_right, optional: true
    option :ownerOccupiedInd, proc(&:to_s), as: :owner_occupied_ind, optional: true
    option :pendingRecordInd, proc(&:to_s), as: :pending_record_ind, optional: true
    option :corporateOwner, proc(&:to_s), as: :corporate_owner, optional: true
    option :ownerVestingCode, proc(&:to_s), as: :owner_vesting_code, optional: true
    option :links, optional: true

  end
end