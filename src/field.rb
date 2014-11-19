module Bowser
  class Field
    attr_reader :key
    attr_accessor :val
    attr_accessor :unmap

    def initialize(key, val)
      @unmap, @key, @val = false, key, val
    end
  end
end
