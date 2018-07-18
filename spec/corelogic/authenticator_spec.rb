require 'spec_helper'

describe Corelogic::Authenticator do
  subject(:authenticator) do
    Corelogic.container['authenticator']
  end

  let(:connection) do
    Corelogic.container['connection']
  end

  let(:oauth_resource) { Corelogic::Authenticator::OAUTH_URL }
  let(:oauth_success_body) { json(:oauth_success_body) }

  describe '#consumer_key' do
    it { expect(authenticator.consumer_key).to eq CONSUMER_KEY }
  end

  describe '#consumer_secret' do
    it { expect(authenticator.consumer_secret).to eq CONSUMER_SECRET }
  end

  describe '#call' do
    before do
      stub_request(:post, oauth_resource).
        with(basic_auth: [CONSUMER_KEY, CONSUMER_SECRET]).
        with(query: {grant_type: 'client_credentials'}).
        to_return(body: oauth_success_body, headers: {content_type: 'application/json'})
    end
    context 'connection is not authenticated' do
      let(:token) { JSON.parse(oauth_success_body)['access_token'] }
      before do
        authenticator.call(connection)
      end
      it 'requests the correct resource' do
        expect(a_request(:post, oauth_resource).
          with(query: {grant_type: 'client_credentials'}, headers: {authorization: "Basic #{ Base64.strict_encode64("#{CONSUMER_KEY}:#{CONSUMER_SECRET}").chomp}"})).
          to have_been_made
      end

      it 'assigns the `bearer_token` to connection' do
        expect(connection.bearer_token).to be_a String
        expect(connection.bearer_token).to eq(token)
      end
    end

    context 'connection authenticated' do
      before do
        allow(connection).to receive(:authenticated?).and_return(true)
      end

      it 'not requests the oauth resource' do
        authenticator.call(connection)

        expect(a_request(:post, oauth_resource).
          with(query: {grant_type: 'client_credentials'}, headers: {authorization: "Basic #{ Base64.strict_encode64("#{CONSUMER_KEY}:#{CONSUMER_SECRET}").chomp}"})).
          to_not have_been_made
      end

      it 'requests the oauth resource if force option received' do
        authenticator.call(connection, force: true)

        expect(a_request(:post, oauth_resource).
          with(query: {grant_type: 'client_credentials'}, headers: {authorization: "Basic #{ Base64.strict_encode64("#{CONSUMER_KEY}:#{CONSUMER_SECRET}").chomp}"})).
          to have_been_made
      end
    end
  end

end