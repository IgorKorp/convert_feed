require "minitest/autorun"
require_relative "../../../lib/reader/url_reader"

class ReaderUrlFileTest < Minitest::Test
  def test_url_reader_rss
    rss_sourse = "https://ru.hexlet.io/lessons.rss"
    rss_link = UrlReader.can_read?(rss_sourse)
    assert rss_link
    rss_file = UrlReader.read(rss_sourse)
    assert rss_file
  end
end
