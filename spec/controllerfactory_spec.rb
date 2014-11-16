require_relative '../src/controllerfactory.rb'

describe Bowser::ControllerFactory do
  describe '::construct' do
    it 'should use a FileLoader to open the directory'

    describe 'when passed a path to a directory' do
      it 'should return a DirectoryController'

      it 'should pass a file to the dircontroller'
      #  controller = spy('DirController')
      #  controller.construct('/path')
      #  expect(controller).to have_received(:new).with(duck_type(:path))
      #end
    end

    describe 'when passed a path to a file' do
      it 'should return a FileController'
      #  result = described_class.construct('/path');
      #  expect(result).to be_an_instance_of(Bowser::FileController)

      it 'should pass a file to the filecontroller'
    end
  end
end
