require_relative "./base/base"

module Converters
  class Converter
    include Converters::Base

    def initialize(data_hash, format)
      @data_hash = data_hash
      @format = format(format)
    end

    def convert
      converter(@data_hash, @format)
    end

    def format(format)
      return @data_hash[:old_format].to_sym if %i[default xml].include?(format)

      format
    end
  end
end
