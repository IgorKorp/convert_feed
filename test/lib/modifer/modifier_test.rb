require "minitest/autorun"
require_relative "../../../lib/reader/file_reader"
require_relative "../../../lib/parser/parser"
require_relative "../../../lib/modifier/modifier"
require_relative "../../support/support_hash"

class ModifierTest < Minitest::Test
  def test_file_modifier_rss_revers
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

    assert_equal reversed_valid_hash, reversed
  end

  def test_file_modifier_rss_sort
    rss_sourse = "../../fixtures/lessons.rss"
    can_read = FileReader.can_read?(rss_sourse)
    assert can_read
    rss_file = FileReader.read(rss_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.rss_hash

    assert_equal prepared_hash, valid_hash

    modified_hash = Modifier.processing(prepared_hash, [:sort])
    sorted = modified_hash[:items].map { |el| el[:date] }
    sorted_valid_hash = SupportHash.sort_rss_hash

    assert_equal sorted_valid_hash, sorted
  end

  def test_file_modifier_atom_revers
    atom_sourse = "../../fixtures/atom"
    can_read = FileReader.can_read?(atom_sourse)
    assert can_read
    rss_file = FileReader.read(atom_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.atom_hash

    assert_equal prepared_hash, valid_hash

    modified_hash = Modifier.processing(prepared_hash, [:reverse])

    reversed = modified_hash[:items].map { |el| el[:date] }
    reversed_valid_hash = SupportHash.reverse_atom_hash

    assert_equal reversed_valid_hash, reversed
  end

  def test_file_modifier_atom_sort
    atom_sourse = "../../fixtures/atom"
    can_read = FileReader.can_read?(atom_sourse)
    assert can_read
    rss_file = FileReader.read(atom_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.atom_hash

    assert_equal prepared_hash, valid_hash

    modified_hash = Modifier.processing(prepared_hash, [:sort])
    sorted = modified_hash[:items].map { |el| el[:date] }
    sorted_valid_hash = SupportHash.sort_atom_hash
    assert_equal sorted_valid_hash, sorted
  end

  def test_file_not_modifier_atom
    atom_sourse = "../../fixtures/atom"
    can_read = FileReader.can_read?(atom_sourse)
    assert can_read
    rss_file = FileReader.read(atom_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.atom_hash

    assert_equal prepared_hash, valid_hash

    not_modified_hash = Modifier.processing(prepared_hash, [])
    not_modified = not_modified_hash[:items].map { |el| el[:date] }
    not_modified_valid = SupportHash.items_atom_hash
    assert_equal not_modified_valid, not_modified
  end

  def test_file_not_modifier_rss
    rss_sourse = "../../fixtures/lessons.rss"
    can_read = FileReader.can_read?(rss_sourse)
    assert can_read
    rss_file = FileReader.read(rss_sourse)
    assert rss_file

    prepared_hash = Parsers::Parser.new(rss_file).parser
    valid_hash = SupportHash.rss_hash

    assert_equal prepared_hash, valid_hash

    not_modified_hash = Modifier.processing(prepared_hash, [])
    not_modified = not_modified_hash[:items].map { |el| el[:date] }
    not_modified_valid = SupportHash.items_rss_hash
    assert_equal not_modified_valid, not_modified
  end
end
