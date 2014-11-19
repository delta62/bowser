require_relative 'controllers/file.rb'
require_relative 'controllers/dir.rb'

module Bowser
  class ControllerFactory
    def initialize(loader)
      @loader = loader
    end

    def controller(path)
      file = @loader.load(path)
      if File.directory? file.path
        reader = DirReader.new(path)
        DirController.new(reader)
      else
        FileController.new(file)
      end
    end
  end
end
