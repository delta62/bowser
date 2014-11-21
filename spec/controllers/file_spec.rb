require 'spec_helper'

describe Bowser::FileController do
  let(:file) { instance_double(File) }
  let(:path) { '/path/to/file' }
  subject { described_class.new(file) }

  before(:example) do
    allow(file).to receive(:path).and_return(path)
  end

  describe '::new' do
    it 'should accept a file object' do
      described_class.new(file)
    end
  end

  describe '#path' do
    it 'should return the file path' do
      expect(subject.path).to eq(path)
    end
  end
end
