require_relative 'controllers/file.rb'

module Bowser
  class ControllerFactory
    def self.construct(path)
      file = File.new(path)

      if File.directory? path
        DirController.new(file)
      else
        FileController.new(file)
      end
    end
  end
end
