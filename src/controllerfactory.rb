require_relative 'controllers/file.rb'
require_relative 'controllers/dir.rb'
require_relative 'dirreader.rb'

module Bowser
  class ControllerFactory
    def initialize(loader)
      @loader = loader
    end

    def controller(path)
      file = @loader.load(path)
      if File.directory? file.path
        reader = DirReader.new(file)
        DirController.new(reader)
      else
        FileController.new(file)
      end
    end
  end
end
