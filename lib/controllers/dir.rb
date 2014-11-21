module Bowser
  class DirController
    def initialize(dirreader)
      @reader = dirreader
    end

    def read
      @reader.each_entry {|e| yield e }
    end

    def as_json(mapper)
      ret = []
      @reader.each_entry do |resource|
        resource.unmap(mapper)
        ret << resource.as_json
      end
      ret
    end
  end
end


