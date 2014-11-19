require_relative 'resource.rb'

module Bowser
  class DirReader
    def initialize(dir)
      @dir = dir
    end

    def each_entry
      path = @dir.path
      @dir.each do |filename|
        r = Resource.new
        r.fields['path'] = File.join(path, filename)
        yield r
      end
    end
  end
end
