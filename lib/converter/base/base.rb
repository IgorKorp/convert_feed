require_relative "./converter_atom"
require_relative "./converter_rss"
require_relative "./converter_json"

module Converters
  module Base
    CONVERTERS = [ConverterAtom, ConverterRss, ConverterJson].freeze

    def converter(data_hash, to_type)
      CONVERTERS.each { |converter| return converter.convert(data_hash) if converter.can_call?(to_type) }
    end
  end
end
