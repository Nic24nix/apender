# Changelog

All notable changes to Apender are documented in this file.

This project follows a simple versioning format based on [Semantic Versioning](https://semver.org/).

## [0.1.0] - 2026-11-01

### Added
- Initial release of Apender.
- Append text to existing files using `-c` or `--content`.
- Append empty lines using `-n` or `--null`.
- Specify target files using `-p` or `--path`.
- Automatically insert a newline when the file does not end with one.
- Preserve existing file contents.
- Display command-line help with `--help`.
- Error handling for missing files and invalid arguments.

### Notes
- Files are not created automatically.
- `-c` and `-n` cannot be used together.
- Initial release published on RubyGems.
