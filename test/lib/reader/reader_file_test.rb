require "minitest/autorun"
require_relative "../../../lib/reader/file_reader"

class ReaderFileTest < Minitest::Test
  def test_file_reader_rss
    rss_sourse = "../../fixtures/lessons.rss"
    can_read = FileReader.can_read?(rss_sourse)
    refute can_read
    rss_file = FileReader.read(rss_sourse)
    refute rss_file
  end

  def test_file_reader_atom
    rss_sourse = "../../fixtures/atom"
    can_read = FileReader.can_read?(rss_sourse)
    refute can_read
    rss_file = FileReader.read(rss_sourse)
    refute rss_file
  end

  def test_file_reader_xml
    rss_sourse = "../../fixtures/file.xml"
    can_read = FileReader.can_read?(rss_sourse)
    refute can_read
    rss_file = FileReader.read(rss_sourse)
    refute rss_file
  end
end
