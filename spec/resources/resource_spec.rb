require 'spec_helper'

describe Bowser::Resource do
  let(:resource) { described_class.new }

  describe '#fields' do
    it 'should be a FieldCollection' do
      expect(subject.fields).to be_an_instance_of(Bowser::FieldCollection)
    end
  end

  describe '#as_json' do
    context 'when fields exist' do
      before(:example) do
        subject.fields
          .add(Bowser::Field.new(:a, val: 1))
          .add(Bowser::Field.new(:b, val: 2))
          .add(Bowser::Field.new(:c, val: 3))
      end

      it 'should return a hash' do
        expect(subject.as_json).to be_an_instance_of(Hash)
      end

      it 'should use field keys as hash keys' do
        expect {|b| subject.as_json.each_key(&b) }.to yield_successive_args(:a, :b, :c)
      end

      it 'should use field values as hash values' do
        expect {|b| subject.as_json.each_value(&b) }.to yield_successive_args(1, 2, 3)
      end
    end

    context 'when no fields exist' do
      it 'should return an empty hash' do
        expect(subject.as_json).to eq({})
      end
    end
  end

  describe '#unmap' do
    let(:mapper) { instance_double(Bowser::Mapper) }
    let(:unmapped) { 'unmapped_path' }

    before(:example) do
      allow(mapper).to receive(:unmap).and_return(unmapped)
      subject.fields
        .add(Bowser::Field.new('foo', unmap: true))
        .add(Bowser::Field.new('bar'))
      subject.unmap(mapper)
    end

    it 'should unmap relevant fields' do
      expect(subject.fields['foo'].val).to eq(unmapped)
    end

    it 'should not unmap irrelivant fields' do
      expect(subject.fields['bar'].val).not_to eq(unmapped)
    end
  end
end

