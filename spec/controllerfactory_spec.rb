require_relative '../src/controllerfactory.rb'
require_relative '../src/fileloader.rb'

describe Bowser::ControllerFactory do
  let(:loader) { instance_double(Bowser::FileLoader) }

  describe '::new' do
    it 'should accept a FileLoader' do
      described_class.new(loader)
    end
  end

  describe '#controller' do
    let(:factory) { described_class.new(loader) }
    let(:path) { '/path/to/file' }
    let(:filestub) { instance_double(File) }

    before(:example) do
      allow(loader).to receive(:load).and_return(filestub)
      allow(filestub).to receive(:path).and_return(path)
    end

    it 'should use a FileLoader to open path' do
      expect(loader).to receive(:load)
      factory.controller(path)
    end

    describe 'when passed a path to a directory' do
      before(:example) do
        allow(File).to receive(:directory?).and_return(true)
      end

      it 'should return a DirectoryController' do
        ret = factory.controller(path)
        expect(ret).to be_an_instance_of(Bowser::DirController)
      end

      it 'should pass a file to the DirectoryController' do
        controller = class_double(Bowser::DirController).as_stubbed_const
        expect(controller).to receive(:new).with(filestub)
        factory.controller(path)
      end
    end

    describe 'when passed a path to a file' do
      before(:example) do
        allow(File).to receive(:directory?).and_return(false)
      end

      it 'should return a FileController' do
        ret = factory.controller(path)
        expect(ret).to be_an_instance_of(Bowser::FileController)
      end

      it 'should pass a file to the filecontroller' do
        controller = class_double(Bowser::FileController).as_stubbed_const
        expect(controller).to receive(:new).with(filestub)
        factory.controller(path)
      end
    end
  end
end
