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
end

