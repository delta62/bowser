module Bowser
  class Mapper
    attr_reader :basepath, :relpath

    def initialize(basepath, relpath)
      @basepath, @relpath = basepath, relpath
    end

    def map
      File.join(@basepath, @relpath)
    end
  end
end
