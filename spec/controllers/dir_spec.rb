require_relative '../../src/controllers/dir.rb'

describe Bowser::DirController do
  describe '::new' do
    it "should throw when path doesn't exist" do
      expect { described_class.new('/nonexistant_file') }.to raise_error
    end
    it "should throw when path isn't a directory" do
      expect { described_class.new('/file') }.to raise_error
    end
  end
end

