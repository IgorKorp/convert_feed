require "minitest/autorun"
require_relative "../../../lib/reader/file_reader"
require_relative "../../../lib/parser/parser"
require_relative "../../support/support_hash"
require_relative "../../../lib/modifier/modifier"
require_relative "../../../lib/converter/converter"

class ConverterTest < Minitest::Test
  def test_convert_file_rss_to_atom_modifier_reverse
    rss_sourse = "../../fixtures/lessons.rss"

    can_read = FileReader.can_read?(rss_sourse)
    assert can_read

    rss_file = FileReader.read(rss_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.rss_hash
    assert_equal prepared_hash, valid_hash

    modified_hash = Modifier.processing(prepared_hash, [:reverse])
    reversed = modified_hash[:items].map { |el| el[:date] }
    reversed_valid_hash = SupportHash.reverse_rss_hash
    assert_equal reversed, reversed_valid_hash

    prepared_file = Converters::Converter.new(modified_hash, :atom).convert
    assert prepared_file
  end

  def test_convert_file_rss_to_atom_modifier_sort
    rss_sourse = "../../fixtures/lessons.rss"

    can_read = FileReader.can_read?(rss_sourse)
    assert can_read

    rss_file = FileReader.read(rss_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.rss_hash
    assert_equal prepared_hash, valid_hash

    modified_hash = Modifier.processing(prepared_hash, [:sort])
    reversed = modified_hash[:items].map { |el| el[:date] }
    reversed_valid_hash = SupportHash.sort_rss_hash
    assert_equal reversed, reversed_valid_hash

    prepared_file = Converters::Converter.new(modified_hash, :atom).convert
    assert prepared_file
  end

  def test_convert_file_atom_to_rss_modifier_sort
    atom_sourse = "../../fixtures/atom"

    can_read = FileReader.can_read?(atom_sourse)
    assert can_read

    atom_file = FileReader.read(atom_sourse)
    assert atom_file

    prepared_hash = Parsers::Parser.new(atom_file).parser
    valid_hash = SupportHash.atom_hash
    assert_equal prepared_hash, valid_hash

    modified_hash = Modifier.processing(prepared_hash, [:sort])
    reversed = modified_hash[:items].map { |el| el[:date] }
    reversed_valid_hash = SupportHash.sort_atom_hash
    assert_equal reversed, reversed_valid_hash

    prepared_file = Converters::Converter.new(modified_hash, :rss).convert
    assert prepared_file
  end

  def test_convert_file_atom_to_rss_modifier_reverse
    atom_sourse = "../../fixtures/atom"

    can_read = FileReader.can_read?(atom_sourse)
    assert can_read

    atom_file = FileReader.read(atom_sourse)
    assert atom_file

    prepared_hash = Parsers::Parser.new(atom_file).parser
    valid_hash = SupportHash.atom_hash
    assert_equal prepared_hash, valid_hash

    modified_hash = Modifier.processing(prepared_hash, [:reverse])
    reversed = modified_hash[:items].map { |el| el[:date] }
    reversed_valid_hash = SupportHash.reverse_atom_hash
    assert_equal reversed, reversed_valid_hash

    prepared_file = Converters::Converter.new(modified_hash, :rss).convert
    assert prepared_file
  end
end
