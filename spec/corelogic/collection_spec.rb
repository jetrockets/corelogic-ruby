require 'spec_helper'

describe Corelogic::Collection do
  let(:records_count) { 3 }
  let(:raw_json) { json(:success_body, count: records_count) }
  let(:class_name) { 'Corelogic::Property' }

  context 'with empty hash' do
    let(:raw_hash) { Hash.new }
    subject { Corelogic::Collection.new(class_name, raw_hash) }

    it { is_expected.to eq [] }
  end

  context 'with hash contains `:data` key' do
    let(:raw_hash) { Corelogic::Utils.deep_symbolize_keys(JSON.parse(raw_json)) }
    subject { Corelogic::Collection.new(class_name, raw_hash) }

    it { expect(subject.size).to eq records_count }
    it { is_expected.to be_instance_of(Array) and all(be_instance_of(class_name)) }

    describe '#to_a' do
      it { expect(subject.to_a.size).to eq records_count }
    end
  end
end