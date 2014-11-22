require 'controllers/file'
require 'controllers/dir'
require 'fs/dirreader'
require 'fs/fileloader'

module Bowser
  # Creates new FileControllers and DirControllers from files
  # and directories, respectively
  class ControllerFactory
    def initialize(loader = nil)
      loader ||= FileLoader.new
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
