require 'resources/resource'
require 'resources/field'

module Bowser
  # Iterate over the entries in a directory, creating resources for each
  # one. Each entry is initialized with a 'path' field, which is set to
  # the entity's absolute path on the filesystem.
  class DirReader
    def initialize(dir)
      @dir = dir
    end

    def each_entry
      base = @dir.path
      @dir.each do |filename|
        r = Resource.new
        path = File.join(base, filename)
        pathfield = Field.new('path', val: path)
        r.fields.add(pathfield)
        yield r
      end
    end
  end
end
