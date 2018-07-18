require 'spec_helper'

RSpec.describe Corelogic::Utils do
  let(:utils) { Corelogic::Utils }
  describe '#deep_symbolize_keys' do
    let(:regular_hash) do
      {
        'a' => 1,
        'b' => {'c' => 3, 'd' => 4},
        'e' => [{'f' => 6, 'g' => 7},{'h' => 8, 'i' => [{'j' => 9},{'k' => 10}]}]
      }
    end
    let(:symbolized_hash) do
      {
        a: 1,
        b: {c: 3, d: 4},
        e: [{f: 6, g: 7}, {h: 8, i: [{j: 9}, {k: 10}]}]
      }
    end


    it 'should deep symbolize keys' do
      expect(utils.deep_symbolize_keys(regular_hash)).to eq(symbolized_hash)
    end
  end

  describe '#validate_keys' do
    it 'should raise `ArgumentError`' do
      expect do
        utils.validate_keys({ :foo => 'foo', :bar => 'jpg' }, [:input, :inputformat])
      end.to raise_error(ArgumentError, 'Required key(s): input, inputformat')
      expect do
        utils.validate_keys({ :foo => 'foo', :bar => 'jpg' }, :input, :inputformat)
      end.to raise_error(ArgumentError, 'Required key(s): input, inputformat')
    end

    it 'does not raise `ArgumentError`' do
      expect do
        utils.validate_keys({ :input => 'foo', :inputformat => 'jpg' }, [:input, :inputformat])
        utils.validate_keys({ :input => 'foo', :inputformat => 'jpg' }, :input, :inputformat)
      end.not_to raise_error
    end
  end

end