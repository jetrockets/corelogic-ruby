require "spec_helper"

describe Corelogic do
  it "has a version number" do
    expect(Corelogic::VERSION).not_to be nil
  end

  describe 'Corelogic#container' do
    it { expect(Corelogic.container.keys.size).to eq(3)}

    it 'should contain `authenticator` key' do
      expect(Corelogic.container.resolve('authenticator')).to be
    end

    it '`authenticator` should be an instance of `Corelogic::Authenticator`' do
      expect(Corelogic.container.resolve('authenticator')).to be_an_instance_of(Corelogic::Authenticator)
    end

    it '`connection` should be an instance of `Corelogic::Connection`' do
      expect(Corelogic.container.resolve('connection')).to be_an_instance_of(Corelogic::Connection)
    end

    it 'should contain `response_parser` key' do
      expect(Corelogic.container.resolve('response_parser')).to be
    end
  end
end
