require_relative '../src/fileloader.rb'

describe Bowser::FileLoader do
  let(:loader) { described_class.new }
  let(:stub) { Class.new }
  let!(:file) { class_double('File').as_stubbed_const }

  before(:example) do
    allow(file).to receive(:new).and_return(stub)
    allow(file).to receive(:exist?).and_return(true)
    allow(file).to receive(:readable?).and_return(true)
  end

  describe '#load' do
    let(:path) { '/path/to/file' }

    it 'should take a file path' do
      loader.load(path)
    end

    it 'should return the opened file' do
      expect(loader.load(path)).to eq(stub)
    end

    it 'should open the correct path' do
      expect(file).to receive(:new).with(path, anything)
      loader.load(path)
    end

    it 'should open the file in read-only mode' do
      expect(file).to receive(:new).with(anything, 'r')
      loader.load(path)
    end

    describe 'when the path does not exist' do
      before(:example) do
        allow(file).to receive(:exist?).and_return(false)
      end

      it 'should throw an error' do
        expect { loader.load(path) }.to raise_error
      end
    end

    describe 'when the file is not readable' do
      before(:example) do
        allow(file).to receive(:readable?).and_return(false)
      end

      it 'should throw an error' do
        expect { loader.load(path) }.to raise_error
      end
    end
  end
end
