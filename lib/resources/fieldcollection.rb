module Bowser
  # A dictionary-like collection that organizes fields. Fields are storedy by
  # their keys, and if two fields with the same key are added an error is
  # raised.
  class FieldCollection
    def initialize
      @fields = []
    end

    def add(field)
      fail "Cannot create duplicate field '#{field.key}'." if get(field.key)
      @fields << field
      self
    end

    def get(key)
      @fields.each { |field| return field if field.key == key }
      nil
    end
    alias_method :[], :get

    def each
      @fields.each { |f| yield f }
    end
  end
end
