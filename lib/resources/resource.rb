require 'resources/fieldcollection'

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
  end
end
