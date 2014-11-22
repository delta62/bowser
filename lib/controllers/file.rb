module Bowser
  # Specialized resource wrapper for file entites
  class FileController
    def initialize(file)
      @file = file
    end

    def path
      @file.path
    end
  end
end
