require 'spec_helper'

describe Corelogic::API::PropertiesRepository do
  subject(:properties) { Corelogic.properties }
  let(:properties_count) { 3 }
  let(:success_body) { json(:success_body, count: properties_count) }
  let(:property_ownership) { json(:ownership_response) }
  let(:connection) { Corelogic.container['connection'] }
  let(:oauth_error_body) { json(:oauth_error_body) }
  let(:oauth_success_body) { json(:oauth_success_body) }

  context 'authenticated connection' do
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
      let(:id) { '34025:7372209' }
      before do
        stub_request(:get, /ownership/).
          to_return(body: property_ownership, headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})
      end

      it 'requests the correct resource on GET' do
        properties.ownership(id)
        expect(a_get("property/#{id}/ownership")).to have_been_made
      end

      it 'returns ownership' do
        result = properties.ownership(id)
        expect(result).to be_instance_of(Corelogic::Property::Ownership)
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

  def a_get(path)
    a_request(:get, Corelogic::Connection::BASE_PATH + path)
  end
end