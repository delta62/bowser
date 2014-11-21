module Bowser
  class FileController
    def initialize(file)
      @file = file
    end

    def path
      @file.path
    end
  end
end
