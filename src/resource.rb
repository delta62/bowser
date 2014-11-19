module Bowser
  class Resource

    attr_reader :fields

    def initialize
      @fields = {}
    end

    def as_json
      @fields
    end

    def unmap(mapper)
      @fields.each_value do |field|
        field.val = mapper.unmap(field.val) if field.unmap
      end
    end
  end
end
