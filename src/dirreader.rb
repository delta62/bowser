require_relative 'resource.rb'
require_relative 'field.rb'

module Bowser
  class DirReader
    def initialize(dir)
      @dir = dir
    end

    def each_entry
      path = @dir.path
      @dir.each do |filename|
        r = Resource.new
        pathfield = Field.new('path', val: File.join(path, filename))
        r.fields.add(pathfield)
        yield r
      end
    end
  end
end
