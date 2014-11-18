module Bowser
  class DirReader
    def initialize(dir)
      @dir = dir
    end

    def each_entry
      @dir.each do |path|
        r = Resource.new
        r.fields['path'] = path
        yield r
      end
    end
  end
end
