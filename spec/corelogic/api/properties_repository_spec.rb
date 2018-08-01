require 'spec_helper'

describe Corelogic::API::PropertiesRepository do
  subject(:properties) { Corelogic.properties }
  let(:properties_count) { 3 }
  let(:success_body) { json(:success_body, count: properties_count) }
  let(:connection) { Corelogic.container['connection'] }
  let(:oauth_error_body) { json(:oauth_error_body) }
  let(:oauth_success_body) { json(:oauth_success_body) }

  context 'authenticated connection' do
    let(:id) { '00000:1111111' }
    let(:common_response) { json(:common_response, corelogicPropertyId: id) }

    before do
      allow(connection).to receive(:authenticated?).and_return(true)
    end

    describe '#serach' do
      before do
        stub_request(:get, Corelogic::Connection::BASE_PATH + 'property').
          to_return(body: success_body, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end
      it 'requests the correct resource on GET' do
        properties.search
        expect(a_get('property')).to have_been_made
      end

      it 'returns properties' do
        result = properties.search
        expect(result).to be_instance_of(Array) and all(be_instance_of(Corelogic::Property))
        expect(result.size).to eq(properties_count)
      end
    end

    describe '#ownership' do
      before do
        stub_request(:get, /ownership/).
          to_return(body: common_response, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.ownership(id)
        expect(a_get("property/#{id}/ownership")).to have_been_made
      end

      it 'returns `Corelogic::Property::Ownership` with id' do
        result = properties.ownership(id)
        expect(result).to be_instance_of(Corelogic::Property::Ownership)
        expect(result.corelogic_property_id).to eq id
      end
    end

    describe '#building' do
      before do
        stub_request(:get, /building/).
          to_return(body: common_response, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.building(id)
        expect(a_get("property/#{id}/building")).to have_been_made
      end

      it 'returns `Corelogic::Property::Building` with id' do
        result = properties.building(id)
        expect(result).to be_instance_of(Corelogic::Property::Building)
        expect(result.corelogic_property_id).to eq id
      end
    end

    describe '#tax_assessment' do
      before do
        stub_request(:get, /tax-assessment/).
          to_return(body: common_response, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.tax_assessment(id)
        expect(a_get("property/#{id}/tax-assessment")).to have_been_made
      end

      it 'returns `Corelogic::Property::TaxAssessment` with id' do
        result = properties.tax_assessment(id)
        expect(result).to be_instance_of(Corelogic::Property::TaxAssessment)
        expect(result.corelogic_property_id).to eq id
      end
    end

    describe '#site' do
      before do
        stub_request(:get, /site/).
          to_return(body: common_response, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.site(id)
        expect(a_get("property/#{id}/site")).to have_been_made
      end

      it 'returns `Corelogic::Property::Site` with id' do
        result = properties.site(id)
        expect(result).to be_instance_of(Corelogic::Property::Site)
        expect(result.corelogic_property_id).to eq id
      end
    end

    describe '#location' do
      before do
        stub_request(:get, /location/).
          to_return(body: common_response, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.location(id)
        expect(a_get("property/#{id}/location")).to have_been_made
      end

      it 'returns `Corelogic::Property::Location` with id' do
        result = properties.location(id)
        expect(result).to be_instance_of(Corelogic::Property::Location)
        expect(result.corelogic_property_id).to eq id
      end
    end

    describe '#owner_transfer' do
      before do
        stub_request(:get, /owner-transfer/).
          to_return(body: common_response, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.owner_transfer(id)
        expect(a_get("property/#{id}/owner-transfer")).to have_been_made
      end

      it 'returns `Corelogic::Property::OwnerTransfer` with id' do
        result = properties.owner_transfer(id)
        expect(result).to be_instance_of(Corelogic::Property::OwnerTransfer)
        expect(result.corelogic_property_id).to eq id
      end
    end

    describe '#last_market_sale' do
      before do
        stub_request(:get, /last-market-sale/).
          to_return(body: common_response, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.last_market_sale(id)
        expect(a_get("property/#{id}/last-market-sale")).to have_been_made
      end

      it 'returns `Corelogic::Property::LastMarketSale` with id' do
        result = properties.last_market_sale(id)
        expect(result).to be_instance_of(Corelogic::Property::LastMarketSale)
        expect(result.corelogic_property_id).to eq id
      end
    end

    describe '#prior_sale' do
      before do
        stub_request(:get, /prior-sale/).
          to_return(body: common_response, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.prior_sale(id)
        expect(a_get("property/#{id}/prior-sale")).to have_been_made
      end

      it 'returns `Corelogic::Property::PriorSale` with id' do
        result = properties.prior_sale(id)
        expect(result).to be_instance_of(Corelogic::Property::PriorSale)
        expect(result.corelogic_property_id).to eq id
      end
    end

  end

  context 'not authenticated connection' do
    before do
      allow(connection).to receive(:authenticated?).and_return(false)
      connection.bearer_token = nil
      stub_request(:post, Corelogic::Authenticator::OAUTH_URL).
        with(query: {grant_type: 'client_credentials'}).
        to_return({body: oauth_success_body, headers: {content_type: 'application/json'}, status: 200})
      stub_request(:get, Corelogic::Connection::BASE_PATH + 'property').
        to_return({body: success_body, headers: {content_type: 'application/json'}, status: 200})
    end

    it 'authenticates connection' do
      properties.search
      expect(connection.bearer_token).to be_a String
    end
  end

  context 'the bearer token has expired' do
    before do
      allow(connection).to receive(:authenticated?).and_return(true)
      stub_request(:get, Corelogic::Connection::BASE_PATH + 'property').
        to_return(
          {body: oauth_error_body, headers: {content_type: 'application/json'}, status: 401},
          {body: success_body, headers: {content_type: 'application/json'}, status: 200}
        )

      stub_request(:post, Corelogic::Authenticator::OAUTH_URL).
        with(query: {grant_type: 'client_credentials'}).
        to_return({body: oauth_success_body, headers: {content_type: 'application/json'}, status: 200})

      properties.search
    end
    it 'tries to re-authenticate' do
      expect(a_get('property')).to have_been_made.times(2)
      expect(a_request(:post, Corelogic::Authenticator::OAUTH_URL).with(query: {grant_type: 'client_credentials'})).to have_been_made.times(1)
    end
  end
end