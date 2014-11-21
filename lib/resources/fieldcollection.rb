module Bowser
  class FieldCollection
    def initialize
      @fields = []
    end

    def add(field)
      if get(field.key)
        raise "Cannot create duplicate field '#{field.key}'."
      end
      @fields << field
      self
    end

    def get(key)
      @fields.each {|field| return field if field.key == key }
      nil
    end
    alias_method :[], :get

    def each
      @fields.each {|f| yield f }
    end
  end
end
