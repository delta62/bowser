require_relative '../src/field.rb'

describe Bowser::Field do
  let(:key) { 'foo' }
  let(:val) { 'bar' }
  subject { described_class.new(key) }

  describe '::new' do
    it 'should require a key and a value' do
      described_class.new(key)
    end

    it 'should default val to nil' do
      expect(subject.val).to be_nil
    end

    context 'optional parameters' do
      it 'should accept a :value parameter' do
        field = described_class.new(key, val: val)
        expect(field.val).to eq(val)
      end
      
      it 'should accept an :unmap parameter' do
        field = described_class.new(key, unmap: true)
        expect(field.unmap).to be_truthy
      end

      it 'should throw with other parameters' do
        expect { described_class.new(key, foo: 'bar') }.to raise_error
      end
    end
  end

  describe '#key' do
    it 'should return the key' do
      expect(subject.key).to eq(key)
    end
  end

  describe '#val' do
    subject { described_class.new(key, val: val) }

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
