# frozen_string_literal: true

require_relative "apender/version"

module Apender
  class Error < StandardError; end

  def self.append(path, content, line: nil, add: false)
    raise Error, "File does not exist: #{path}" unless File.file?(path)

    if line
      write_line(path, content, line, add)
      return
    end

    File.open(path, "a") do |file|
      unless File.zero?(path)
        last_byte = File.binread(path, 1, File.size(path) - 1)
        file.write("\n") unless last_byte == "\n"
      end

      file.puts(content)
    end
  end

  def self.write_line(path, content, line, add)
    raise Error, "Line number must be greater than 0" unless line.positive?
    raise Error, "Content must be a single line" if content.include?("\n")

    original = File.read(path)
    trailing_newline = original.end_with?("\n")

    lines = original.split("\n", -1)
    lines.pop if trailing_newline

    while lines.length < line
      lines << ""
    end

    if add
      lines[line - 1] ||= ""
      lines[line - 1] += content
    else
      lines[line - 1] = content
    end

    result = lines.join("\n")
    result += "\n" if trailing_newline

    File.write(path, result)
  end

  def self.newline(path)
    raise Error, "File does not exist: #{path}" unless File.file?(path)

    File.open(path, "a") do |file|
      file.puts
    end
  end
end

