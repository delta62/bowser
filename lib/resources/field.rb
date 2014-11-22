module Bowser
  # An atomic piece of metadata about a resource. A field must have a
  # key that is unique to the resource it describes.
  class Field
    attr_reader :key
    attr_accessor :val

    def initialize(key, opts = {})
      @key = key
      @val = opts.delete(:val)
      fail 'Unexpected field value' unless opts.empty?
    end
  end
end
