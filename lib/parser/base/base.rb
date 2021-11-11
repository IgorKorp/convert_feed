require_relative "./parser_atom"
require_relative "./parser_rss"
require "rss"

module Parsers
  module Base
    PARSERS = [ParserAtom, ParserRss].freeze

    def parse(data)
      file = file_to_object(data)
      PARSERS.each { |parser| return parser.parse(file) if parser.can_call?(file.feed_type) }
    end

    def file_to_object(file)
      RSS::Parser.parse(file)
    rescue StandardError
      false
    end
  end
end
