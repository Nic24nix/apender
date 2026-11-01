# frozen_string_literal: true

require_relative "lib/apender/version"

Gem::Specification.new do |spec|
  spec.name = "apender"
  spec.version = Apender::VERSION
  spec.authors = ["Nicolau"]
  spec.email = ["nic13araujo@proton.me"]

  spec.summary = "A simple CLI tool to append and edit file lines"
  spec.description = "Apender is a lightweight Ruby CLI tool that appends content to files, replaces specific lines, and adds text to existing lines."
  spec.homepage = "https://github.com/Nic24nix/apender"
  spec.license = "MIT"

  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Nic24nix/apender/tree/master"
  spec.metadata["changelog_uri"] = "https://github.com/Nic24nix/apender/blob/master/CHANGELOG.md"

  gemspec = File.basename(__FILE__)

  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |file|
      file == gemspec ||
        file.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/])
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |file| File.basename(file) }
  spec.require_paths = ["lib"]
end
