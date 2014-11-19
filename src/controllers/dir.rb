module Bowser
  class DirController
    def initialize(dirreader)
      @reader = dirreader
    end

    def read
      @reader.each_entry {|e| yield e }
    end

    def as_json
      ret = []
      @reader.each_entry do |resource|
        ret << resource.as_json
      end
      ret
    end
  end
end


