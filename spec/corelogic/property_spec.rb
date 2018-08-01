require 'spec_helper'

RSpec.describe Corelogic::Property do
  let(:property) { build(:property) }
  let(:connection) { Corelogic.container['connection'] }

  describe '#load_details' do
    before do
      allow(connection).to receive(:authenticated?).and_return(true)
      stub_request(:get, /property-detail/).
        to_return(body: File.new(File.expand_path('./spec/support/details_body.txt')), headers: {content_type: 'application/vnd.corelogic.v1+json;charset=UTF-8'})

      property.load_details
    end

    it 'requests the correct resource on GET' do
      expect(a_get("property/#{property.id}/property-detail")).to have_been_made
    end

    it 'returns `Corelogic::Property` with loaded data' do
      expect(property).to be_instance_of(Corelogic::Property)
      expect(property.ownership).to be_instance_of(Corelogic::Property::Ownership)
      expect(property.building).to be_instance_of(Corelogic::Property::Building)
      expect(property.tax_assessment).to be_instance_of(Corelogic::Property::TaxAssessment)
      expect(property.site).to be_instance_of(Corelogic::Property::Site)
      expect(property.location).to be_instance_of(Corelogic::Property::Location)
      expect(property.owner_transfer).to be_instance_of(Corelogic::Property::OwnerTransfer)
      expect(property.last_market_sale).to be_instance_of(Corelogic::Property::LastMarketSale)
      expect(property.prior_sale).to be_instance_of(Corelogic::Property::PriorSale)
    end
  end
end