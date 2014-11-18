module Bowser
  class Field
    attr_reader :key
    attr_accessor :val

    def initialize(key, val)
      @key, @val = key, val
    end
  end
end
