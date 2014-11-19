module Bowser
  class DirController
    def initialize(dirreader)
      @reader = dirreader
    end

    def read
      @reader.each_entry {|e| yield e }
    end
  end
end


