require_relative '../../src/controllers/dir.rb'

describe Bowser::DirController do
  let(:reader) { instance_double(Bowser::DirReader) }

  describe '::new' do
    it 'should accept a file and a dirreader' do
      described_class.new(reader)
    end
  end

  describe '#read' do
    subject { described_class.new(reader) }
    let(:entries) { ['.', '..', 'a.txt.', 'b'] }

    before(:example) do
      stub = allow(reader).to receive(:each_entry)
      entries.each do |path|
        resource = Bowser::Resource.new
        resource.fields['path'] = path
        stub.and_yield(resource)
      end
    end

    it 'should yield each child of the directory' do
      expect {|b| subject.read(&b) }.to yield_control.exactly(entries.length).times
    end

    it 'should return a list of resouces' do
      subject.read do |entry|
        expect(entry).to be_an_instance_of(Bowser::Resource)
      end
    end
  end
end
