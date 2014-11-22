module Bowser
  class Field
    attr_reader :key
    attr_accessor :val

    def initialize(key, opts={})
      @key = key
      @val = opts.delete(:val)
      raise 'Unexpected field value' if !opts.empty?
    end
  end
end
