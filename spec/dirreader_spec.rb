require_relative '../src/fieldcollection.rb'
require_relative '../src/dirreader.rb'

describe Bowser::DirReader do
  let(:dir) { instance_double(Dir) }

  describe '::new' do
    it 'should take a file' do
      described_class.new(dir)
    end
  end

  describe '#each_entry' do
    let(:dir) { instance_double(Dir) }
    let(:path) { '/foo/bar/baz' }
    let(:reader) { described_class.new(dir) }
    let(:entries) { ['.', '..', 'a.txt', 'b'] }

    before(:example) do
      allow(dir).to receive(:path).and_return(path)
      stub = allow(dir).to receive(:each)
      entries.each {|path| stub.and_yield(path) }
    end

    it 'should include all entries' do
      yield_count = 0
      reader.each_entry {|e| yield_count += 1 }
      expect(yield_count).to eq(entries.length)
    end

    it 'should yield for each entry' do
      expect {|b| reader.each_entry(&b) }.to yield_control.exactly(entries.length).times
    end

    it 'should create a resource for each entry' do
      reader.each_entry do |resource|
        expect(resource).to be_an_instance_of(Bowser::Resource)
      end
    end

    it 'should set the path key for each resource' do
      i = 0
      reader.each_entry do |resource|
        expectedpath = File.join(path, entries[i])
        pathfield = resource.fields['path']
        expect(pathfield.val).to eq(expectedpath)
        i += 1
      end
    end

    it 'should set path to be unmapped' do
      reader.each_entry do |resource|
        expect(resource.fields['path'].unmap).to be_truthy
      end
    end

  end
end
