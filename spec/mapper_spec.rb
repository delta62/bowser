require 'spec_helper'

describe Bowser::Mapper do
  let(:base) { '/base/path' }
  let(:rel) { '/rel/path' }
  let(:longpath) { File.join(base, rel) }
  subject { described_class.new(base) }

  describe '::new' do
    it 'should accept a base path' do
      described_class.new(base)
    end
  end

  describe '#map' do
    it 'should concatenate base and rel paths' do
      expect(subject.map(rel)).to eq('/base/path/rel/path')
    end
  end

  describe '#unmap' do
    it 'should remove base path' do
      expect(subject.unmap(longpath)).to eq(rel)
    end

    context "when path doesn't start with basepath" do
      it 'should throw an error' do
        jankypath = File.join('asdf', rel)
        expect { subject.unmap(jankypath) }.to raise_error
      end
    end
  end
end
