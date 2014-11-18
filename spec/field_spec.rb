require_relative '../src/field.rb'

describe Bowser::Field do
  let(:key) { 'foo' }
  let(:val) { 'bar' }

  describe '::new' do
    it 'should require a key and a value' do
      described_class.new(key, val)
    end
  end

  describe '#key' do
    let(:field) { described_class.new(key, val) }

    it 'should return the key' do
      expect(field.key).to eq(key)
    end
  end

  describe '#val' do
    let(:field) { described_class.new(key, val) }

    it 'should return the value' do
      expect(field.val).to eq(val)
    end

    it 'should allow modification' do
      field.val = 88
      expect(field.val).to eq(88)
    end
  end
end
