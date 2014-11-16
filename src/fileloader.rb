module Bowser
  class FileLoader
    def load(path)
      if !File.exist? path
        raise "Cannot open #{path}, because it does not exist"
      end

      if !File.readable? path
        raise "Cannot open #{path}, because it is not readable"
      end

      File.new(path, 'r')
    end
  end
end
