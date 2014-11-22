require 'resources/resource'
require 'resources/field'

module Bowser
  class DirReader
    def initialize(dir)
      @dir = dir
    end

    def each_entry
      base = @dir.path
      @dir.each do |filename|
        r = Resource.new
        path = File.join(base, filename)
        pathfield = Field.new('path', val: path, unmap: true)
        r.fields.add(pathfield)
        yield r
      end
    end
  end
end
