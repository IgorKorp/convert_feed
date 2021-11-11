# frozen_string_literal: true

require_relative "./reader/file_reader"
require_relative "./reader/url_reader"
require_relative "./parser/parser"
require_relative "./converter/converter"
require_relative "./modifier/modifier"
require_relative "./output/output"

class Application
  READERS = [FileReader, UrlReader].freeze

  def initialize(options, data)
    @data = data
    @modifiers = options[:modifiers]
    @format = options[:format].to_sym
    @output = options[:output]
  end

  def run
    reader = READERS.find { |file| file.can_read?(@data) }
    file = reader.nil? ? raise : reader.read(@data)
    prepared_hash = Parsers::Parser.new(file).parser

    format(prepared_hash[:old_format])
    modified_hash = Modifier.processing(prepared_hash, @modifiers)
    prepared_file = Converters::Converter.new(modified_hash, @format).convert
    Output.output(prepared_file, @output, @format)
  rescue StandardError => e
    puts "Run failed", e
  end

  private

  def format(format)
    @format = format.to_sym if @format == :default
  end
end
