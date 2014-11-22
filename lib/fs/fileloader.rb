module Bowser
  # Abstraction layer for oening files and directories from disk.
  class FileLoader
    def load(path)
      validate(path)
      if File.directory? path
        Dir.new(path)
      else
        File.new(path, 'r')
      end
    end

    def validate(path)
      unless File.exist? path
        fail "Cannot open #{path}, because it does not exist"
      end
      unless File.readable? path
        fail "Cannot open #{path}, because it is not readable"
      end
      true
    end
  end
end
