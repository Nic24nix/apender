
# frozen_string_literal: true

require_relative "apender/version"

module Apender
  class Error < StandardError; end

  def self.append(path, content)
    raise Error, "File does not exist: #{path}" unless File.file?(path)

    File.open(path, "a") do |file|
      unless File.zero?(path)
        last_byte = File.binread(path, 1, File.size(path) - 1)
        file.write("\n") unless last_byte == "\n"
      end

      file.puts(content)
    end
  end

  def self.newline(path)
    raise Error, "File does not exist: #{path}" unless File.file?(path)

    File.open(path, "a") do |file|
      file.puts
    end
  end
end

