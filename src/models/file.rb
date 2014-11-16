require 'mongoid'

module Bowser
  class File
    include Mongoid::Document
    field :path, type: String
  end
end
