require 'spec_helper'

describe Bowser::FileLoader do
  subject { described_class.new }

  let(:stub) { Class.new }
  let!(:file) { class_double(File).as_stubbed_const }
  let!(:dir) { class_double(Dir).as_stubbed_const }

  before(:example) do
    allow(file).to receive(:new).and_return(stub)
    allow(file).to receive(:exist?).and_return(true)
    allow(file).to receive(:readable?).and_return(true)
    allow(file).to receive(:directory?).and_return(false)
  end

  describe '#load' do
    let(:path) { '/path/to/file' }

    it 'should take a file path' do
      subject.load(path)
    end

    it 'should open the correct path' do
      expect(file).to receive(:new).with(path, anything)
      subject.load(path)
    end

    it 'should validate the file' do
      expect(subject).to receive(:validate).once
      subject.load(path)
    end

    describe 'when the path points to a file' do
      it 'should return the opened file' do
        expect(subject.load(path)).to eq(stub)
      end

      it 'should open the file in read-only mode' do
        expect(file).to receive(:new).with(anything, 'r')
        subject.load(path)
      end
    end

    describe 'when the path points to a directory' do
      let(:dirstub) { instance_double(Dir) }

      before(:example) do
        allow(file).to receive(:directory?).and_return(true)
        allow(dir).to receive(:new).and_return(dirstub)
      end

      it 'should return a Dir when path points to a directory' do
        expect(dir).to receive(:new).with(path)
        subject.load(path)
      end
    end

    describe '#validate' do
      it 'should fail when file is not readable' do
        allow(file).to receive(:exist?).and_return(false)
        expect { subject.validate(path) }.to raise_error
      end

      it 'should fail when file does not exist' do
        allow(file).to receive(:readable?).and_return(false)
        expect { subject.validate(path) }.to raise_error
      end
    end
  end
end
