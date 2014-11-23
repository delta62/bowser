# Filesystem abstraction layer
module Bowser
  def self.meta(file)
    Bowser::ControllerFactory.new(file)
    {}
  end
end
