require 'resources/fieldcollection'

module Bowser
  # Represents a single file or folder entity.
  #
  # A resource has a collection of fields, which contain atomic pieces of
  # metadata.
  #
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
