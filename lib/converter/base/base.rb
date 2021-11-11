require_relative "./converter_atom"
require_relative "./converter_rss"

module Converters
  module Base
    CONVERTERS = [ConverterAtom, ConverterRss].freeze

    def converter(data_hash, type)
      CONVERTERS.each { |converter| return converter.convert(data_hash) if converter.can_call?(type) }
    end
  end
end
