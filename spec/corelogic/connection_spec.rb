require 'spec_helper'

describe Corelogic::Connection do
  subject(:connection) do
    Corelogic.container['connection']
  end
  let(:success_body) { json(:success_body) }
  let(:token) { SecureRandom.hex }

  describe '#get' do
    before do
      stub_request(:get, /property/).to_return(body: success_body, status: 200)
    end

    it { expect(connection).to respond_to(:get) }

    it "returns an instance of `HTTP::Response`" do
      expect(connection.get(Corelogic::API::PropertiesRepository::SEARCH_PATH)).to be_an_instance_of(HTTP::Response)
    end

    it { expect(connection.get(Corelogic::API::PropertiesRepository::SEARCH_PATH).body.to_s).to eq success_body }
  end

  describe '#authenticated?' do
    it 'returns true if the `bearer_token` is present' do
      connection.bearer_token = token
      expect(connection.authenticated?).to be true
    end
    it 'returns false if the `bearer_token` is not present' do
      connection.bearer_token = ''
      expect(connection.authenticated?).to be false
    end
  end

end