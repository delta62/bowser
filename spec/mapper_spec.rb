require_relative '../src/mapper.rb'

describe Bowser::Mapper do
  let(:mapper) { described_class.new('/base/path', 'rel/path') }

  describe '::new' do

    it 'should read a base path' do
      expect(mapper.basepath).to eq('/base/path')
    end

    it 'should read a relative path' do
      expect(mapper.relpath).to eq('rel/path')
    end
  end

  describe '#map' do
    it 'should concatenate base and rel paths' do
      expect(mapper.map).to eq('/base/path/rel/path')
    end
  end
end
