require_relative '../src/field.rb'

describe Bowser::Field do
  let(:key) { 'foo' }
  let(:val) { 'bar' }
  subject { described_class.new(key, val) }

  describe '::new' do
    it 'should require a key and a value' do
      described_class.new(key, val)
    end
  end

  describe '#key' do
    it 'should return the key' do
      expect(subject.key).to eq(key)
    end
  end

  describe '#val' do
    it 'should return the value' do
      expect(subject.val).to eq(val)
    end

    it 'should allow modification' do
      subject.val = 88
      expect(subject.val).to eq(88)
    end
  end

  describe '#unmap' do
    it 'should default to falsey' do
      expect(subject.unmap).to be_falsey
    end

    it 'should allow set' do
      subject.unmap = true
    end

    it 'should allow get' do
      subject.unmap = 88
      expect(subject.unmap).to eq(88)
    end
  end
end
