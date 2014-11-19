module Bowser
  class Resource

    attr_reader :fields

    def initialize
      @fields = {}
    end

    def as_json
      @fields
    end
  end
end
