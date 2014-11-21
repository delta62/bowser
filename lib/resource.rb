require_relative 'fieldcollection.rb'

module Bowser
  class Resource
    attr_reader :fields

    def initialize
      @fields = FieldCollection.new
    end

    def as_json
      fields = {}
      @fields.each do |field|
        fields[field.key] = field.val
      end
      fields
    end

    def unmap(mapper)
      @fields.each do |field|
        field.val = mapper.unmap(field.val) if field.unmap
      end
    end
  end
end
