module Bowser
  class Mapper
    def initialize(basepath)
      @basepath = basepath
    end

    def map(relpath)
      File.join(@basepath, relpath)
    end

    def unmap(fullpath)
      if !fullpath.start_with? @basepath
        raise "Cannot unmap #{fullpath} with a base of #{@basepath}"
      end
      base = Regexp.escape(@basepath)
      fullpath.sub(base, '')
    end
  end
end
