require 'dry-initializer'

module Corelogic
  class Property::Ownership
    extend Dry::Initializer
    option :corelogicPropertyId, proc(&:to_s), as: :corelogic_property_id
    option :compositePropertyId, proc(&:to_s), as: :omposite_property_id
    option :ownerName1, proc(&:to_s), as: :owner_name1
    option :ownerName2, proc(&:to_s), as: :owner_name2
    option :vestingOwner1, proc(&:to_s), as: :vesting_owner1
    option :vestingOwner2, proc(&:to_s), as: :vesting_owner2
    option :vestingOwner3, proc(&:to_s), as: :vesting_owner3
    option :vestingOwner4, proc(&:to_s), as: :vesting_owner4
    option :mailingAddress, proc(&:to_s), as: :mailing_address
    option :mailingCityState, proc(&:to_s), as: :mailing_city_state
    option :mailingZip5, proc(&:to_s), as: :mailing_zip5
    option :mailingZip4, proc(&:to_s), as: :mailing_zip4
    option :mailingCarrierRoute, proc(&:to_s), as: :mailing_carrier_route
    option :mailingCareOfName, proc(&:to_s), as: :mailing_care_of_name
    option :phoneNumber, proc(&:to_s), as: :phone_number
    option :vestingEtal, proc(&:to_s), as: :vesting_etal
    option :vestingOwnershipRight, proc(&:to_s), as: :vesting_ownership_right
    option :ownerOccupiedInd, proc(&:to_s), as: :owner_occupied_ind
    option :pendingRecordInd, proc(&:to_s), as: :pending_record_ind
    option :corporateOwner, proc(&:to_s), as: :corporate_owner
    option :ownerVestingCode, proc(&:to_s), as: :owner_vesting_code
    option :links

  end
end