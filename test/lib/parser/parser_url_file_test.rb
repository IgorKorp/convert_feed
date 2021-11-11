require "minitest/autorun"
require_relative "../../../lib/reader/url_reader"
require_relative "../../../lib/parser/parser"

class ParserUrlFileTest < Minitest::Test
  def test_file_parse_rss
    rss_sourse = "https://ru.hexlet.io/lessons.rss"
    rss_link = UrlReader.can_read?(rss_sourse)
    assert rss_link
    rss_file = UrlReader.read(rss_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    assert prepared_hash
  end
end
