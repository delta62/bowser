require 'spec_helper'

describe Bowser::DirController do
  let(:reader) { instance_double(Bowser::DirReader) }
  let(:entries) { ['.', '..', 'a.txt.', 'b'] }
  subject { described_class.new(reader) }

  before(:example) do
    stub = allow(reader).to receive(:each_entry)
    entries.each do |path|
      resource = Bowser::Resource.new
      pathfield = Bowser::Field.new('path', val: path)
      resource.fields.add(pathfield)
      stub.and_yield(resource)
    end
  end

  describe '::new' do
    it 'should accept a file and a dirreader' do
      described_class.new(reader)
    end
  end

  describe '#read' do
    it 'should yield each child of the directory' do
      expect { |b| subject.read(&b) }
        .to yield_control.exactly(entries.length).times
    end

    it 'should return a list of resouces' do
      subject.read do |entry|
        expect(entry).to be_an_instance_of(Bowser::Resource)
      end
    end
  end

  describe '#as_json' do
    it 'should return an array' do
      expect(subject.as_json).to be_an_instance_of(Array)
    end

    it 'should return all resources' do
      expect(subject.as_json.length).to eq(entries.length)
    end

    it 'should use resources #as_json output' do
      resource = instance_double(Bowser::Resource)
      allow(reader).to receive(:each_entry).and_yield(resource)
      expect(resource).to receive(:as_json)
      subject.as_json
    end
  end
end
