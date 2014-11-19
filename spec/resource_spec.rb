require_relative '../src/resource.rb'

describe Bowser::Resource do
  let(:resource) { described_class.new }

  describe '#fields' do
    it 'should be iterable' do
      expect(resource.fields).to respond_to(:each)
    end

    it 'should use the index operator' do
      expect(resource.fields).to respond_to(:[])
    end

    it 'should fetch items by key' do
      resource.fields['foo'] = 'bar'
      expect(resource.fields['foo']).to eq('bar')
    end
  end

  describe '#as_json' do
    context 'when fields exist' do
      before(:example) do
        subject.fields[:a] = 1
        subject.fields[:b] = 2
        subject.fields[:c] = 3
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
end

