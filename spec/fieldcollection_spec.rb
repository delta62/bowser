require_relative '../src/field.rb'
require_relative '../src/fieldcollection.rb'

describe Bowser::FieldCollection do
  let(:field1) { Bowser::Field.new('field1') }
  let(:field2) { Bowser::Field.new('field2') }

  describe '#add' do
    it 'should add a field' do
      subject.add(field1)
      expect(subject[field1.key]).to eq(field1)
    end

    it 'should error when redefining a key' do
      subject.add(field1)
      expect { subject.add(field1) }.to raise_error
    end

    it 'should return self' do
      expect(subject.add(field1)).to eq(subject)
    end
  end

  # This is an alias of #get
  describe '#[]' do
    let(:ndef) { 'undefined key' }

    before(:example) do
      subject.add(field1).add(field2)
    end
    
    it 'should get fields by key' do
      expect(subject[field2.key]).to eq(field2)
    end

    it 'should return nil for an unset key' do
      expect(subject[ndef]).to be_nil
    end
  end

  describe '#each' do
    before(:example) do
      subject.add(field1).add(field2)
    end

    it 'should yield each element' do
      expect {|b| subject.each(&b) }.to yield_control.exactly(2).times
    end
  end
end
