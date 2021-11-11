require "minitest/autorun"
require_relative "../../../lib/reader/file_reader"
require_relative "../../../lib/parser/parser"
require_relative "../../support/support_hash"

class ParserFileTest < Minitest::Test
  def test_file_parse_rss
    rss_sourse = "../../fixtures/lessons.rss"
    can_read = FileReader.can_read?(rss_sourse)
    assert can_read
    rss_file = FileReader.read(rss_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.rss_hash
    assert_equal prepared_hash, valid_hash
  end

  def test_file_parse_atom
    rss_sourse = "../../fixtures/atom"
    can_read = FileReader.can_read?(rss_sourse)
    assert can_read
    rss_file = FileReader.read(rss_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.atom_hash
    assert_equal prepared_hash, valid_hash
  end

  def test_file_parse_xml
    rss_sourse = "../../fixtures/file.xml"
    can_read = FileReader.can_read?(rss_sourse)
    assert can_read
    rss_file = FileReader.read(rss_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.rss_hash
    assert_equal prepared_hash, valid_hash
  end
end
