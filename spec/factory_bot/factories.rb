FactoryBot.define do
  factory :oauth_success_body, class: OpenStruct do
    skip_create
    access_token Faker::Internet.password
    expires_in '3599'
    token_type 'Bearer'
  end

  factory :oauth_error_body, class: OpenStruct do
    skip_create
    fault do
      {
        faultstring: "Invalid access token",
        detail: { errorcode: "oauth.v2.InvalidAccessToken" }
      }
    end
  end
  factory :ownership_response, class: OpenStruct do
    skip_create
    corelogicPropertyId { "#{Faker::Number.number(5)}:#{Faker::Number.number(8)}" }
    compositePropertyId { "#{Faker::Number.number(5)}:#{Faker::Number.number(8)}" }
    ownerName1 Faker::StarWars.character
    ownerName2 Faker::StarWars.character
    vestingOwner1 Faker::StarWars.character
    vestingOwner2 Faker::StarWars.character
    vestingOwner3 ""
    vestingOwner4 ""
    mailingAddress Faker::Address.street_address
    mailingCityState { "#{Faker::Address.city} #{Faker::Address.state_abbr}" }
    mailingZip5 Faker::Address.zip_code
    mailingZip4 Faker::Address.zip_code
    mailingCarrierRoute ""
    mailingCareOfName ""
    phoneNumber ""
    vestingEtal ""
    vestingOwnershipRight ""
    ownerOccupiedInd "A"
    pendingRecordInd nil
    corporateOwner ""
    ownerVestingCode ""
    links {
      [{
        "rel": "self",
        "href": "https://api-prod.corelogic.com/property/00000:00000000/ownership",
        "hreflang": nil,
        "media": nil,
        "title": nil,
        "type": "application/vnd.corelogic.v1+json",
        "deprecation": nil
      }]
    }
  end

  factory :property, class: Corelogic::Property do
    corelogicPropertyId { "#{Faker::Number.number(5)}:#{Faker::Number.number(8)}" }
    compositePropertyId { "#{Faker::Number.number(5)}:#{Faker::Number.number(8)}" }
    streetAddress Faker::Address.street_address
    houseNumber Faker::Address.building_number
    houseNumber2 nil
    preDirection nil
    streetName Faker::Address.street_name
    streetSuffix Faker::Address.street_suffix
    postDirection nil
    unitNumber nil
    city Faker::Address.city
    zipcode Faker::Number.number(5).to_s
    zip4 Faker::Number.number(4).to_s
    state Faker::Address.state_abbr
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    fipsCode Faker::Address.zip.to_s
    parcelNumber Faker::Number.number(9).to_s
    parcelSequence Faker::Number.number(1).to_s
    carrierRoute "C002"
    links {
      [
        {"rel"=>"self",
        "href"=>"https://api-prod.corelogic.com/property/00000:00000000",
        "hreflang"=>nil,
        "media"=>nil,
        "title"=>nil,
        "type"=>"application/vnd.corelogic.v1+json",
        "deprecation"=>nil}
      ]
    }

    initialize_with { new(attributes) }
  end


  factory :success_body, class: OpenStruct do
    transient do
      count 1
    end

    pageNumber 1
    pageSize 1
    totalRecords 1
    totalPages 1
    data { count.times.map { attributes_for(:property) } }
  end
end
