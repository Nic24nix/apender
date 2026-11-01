# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
require "fileutils"
require_relative "../lib/apender"

class ApenderTest < Minitest::Test
  def setup
    @directory = Dir.mktmpdir
    @path = File.join(@directory, "test.txt")
    File.write(@path, "LISTA\nLEITE\nPAO\n")
  end

  def teardown
    FileUtils.remove_entry(@directory)
  end

  def test_append_content
    Apender.append(@path, "OVOS")

    assert_equal "LISTA\nLEITE\nPAO\nOVOS\n", File.read(@path)
  end

  def test_append_empty_line
    Apender.newline(@path)

    assert_equal "LISTA\nLEITE\nPAO\n\n", File.read(@path)
  end

  def test_replace_specific_line
    Apender.append(@path, "OVOS", line: 3)

    assert_equal "LISTA\nLEITE\nOVOS\n", File.read(@path)
  end

  def test_add_content_to_existing_line
    Apender.append(@path, " COMPRAS", line: 1, add: true)

    assert_equal "LISTA COMPRAS\nLEITE\nPAO\n", File.read(@path)
  end

  def test_create_missing_lines
    Apender.append(@path, "MANTEIGA", line: 6)

    assert_equal "LISTA\nLEITE\nPAO\n\n\nMANTEIGA\n", File.read(@path)
  end

  def test_reject_line_zero
    assert_raises(Apender::Error) do
      Apender.append(@path, "OVOS", line: 0)
    end
  end

  def test_reject_missing_file
    assert_raises(Apender::Error) do
      Apender.append("missing.txt", "OVOS")
    end
  end

    def test_replace_line_in_empty_file
    File.write(@path, "")
    Apender.append(@path, "HELLO", line: 1)
    assert_equal "HELLO", File.read(@path)
  end

  def test_edit_file_without_trailing_newline
    File.write(@path, "LISTA\nLEITE")
    Apender.append(@path, "OVOS", line: 2)
    assert_equal "LISTA\nOVOS", File.read(@path)
  end

  def test_add_content_to_missing_line
    File.write(@path, "LISTA")
    Apender.append(@path, "OVOS", line: 3, add: true)
    assert_equal "LISTA\n\nOVOS", File.read(@path)
  end

   end
