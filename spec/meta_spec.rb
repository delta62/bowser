require 'spec_helper'

describe Bowser do
  describe '::meta' do
    let(:file) { '/path/to/file' }

    it 'should return a Hash' do
      expect(subject.meta(file)).to be_an_instance_of(Hash)
    end

    it 'should create a ControllerFactory' do
      factory = class_double(Bowser::ControllerFactory).as_stubbed_const
      expect(factory).to receive(:new).with(file)
      subject.meta(file)
    end
  end
end
