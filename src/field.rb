module Bowser
  class Field
    attr_reader :key
    attr_accessor :val
    attr_accessor :unmap

    def initialize(key, opts={})
      @key = key
      @val = opts.delete(:val)
      @unmap = opts.delete(:unmap)

      raise 'Unexpected field value' if !opts.empty?
    end
  end
end
