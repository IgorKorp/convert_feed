module Converters
  module ConverterJson
    def self.can_call?(type)
      type == :json
    end

    def self.convert(hash)
      hash.to_json
    end
  end
end
