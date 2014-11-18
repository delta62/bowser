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
    let(:reader) { described_class.new(dir) }

    before(:example) do
      allow(dir).to receive(:each)
        .and_yield('.')
        .and_yield('..')
        .and_yield('a.txt')
        .and_yield('b')
    end

    it 'should include all entries' do
      yield_count = 0
      reader.each_entry {|e| yield_count += 1 }
      expect(yield_count).to eq(4)
    end

    it 'should create a resource for each entry' do
      last = nil
      reader.each_entry {|e| last = e }
      expect(last).to be_an_instance_of(Bowser::Resource)
    end

    it 'should set the path key for each resource' do
      reader.each_entry do |e|
        expect(e.fields['path']).to eq('.')
        break
      end
    end
  end
end
