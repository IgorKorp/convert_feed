require_relative "./parser_atom"
require_relative "./parser_rss"
require_relative "./parser_json"
require "rss"
require "json"
require "ostruct"

module Parsers
  module Base
    PARSERS = [ParserAtom, ParserRss, ParserJson].freeze

    def parse(data)
      file = file_to_object(data)
      PARSERS.each { |parser| return parser.parse(file) if parser.can_call?(file.feed_type) }
    end

    def file_to_object(file)
      object = RSS::Parser.parse(file)
      object = json_to_object(file) if object.nil?
      object
    rescue StandardError
      false
    end

    def json_to_object(file)
      object = JSON.parse(file, object_class: OpenStruct)
      def object.feed_type
        "json"
      end
      object
    end
  end
end
