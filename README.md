# Apender

**A simple Ruby CLI tool to append content to existing files.**

Apender is a lightweight command-line utility written in Ruby. It allows you to append text or empty lines to files without overwriting their existing contents.

## Features

- Append text to existing files.
- Append empty lines.
- Preserve all existing file contents.
- Automatically insert a newline when the file doesn't end with one.
- Simple command-line interface.
- Does not create files that don't exist.

## Installation

### RubyGems

```bash
gem install apender
```

### Arch Linux / CachyOS

Once available in the AUR:

```bash
paru -S apender
```

### From source

```bash
git clone https://github.com/Nic24nix/apender.git
cd apender
gem build apender.gemspec
gem install --user-install ./apender-0.1.0.gem
```

## Usage

### Append text

```bash
append -p ~/notes.txt -c "Hello, world!"
```

This appends `Hello, world!` to the end of `notes.txt`.

### Append an empty line

```bash
append -p ~/notes.txt -n
```

This appends an empty line to the file.

### Display help

```bash
append --help
```

## Options

| Option | Description |
|---|---|
| `-p PATH`, `--path PATH` | Path to the existing file |
| `-c CONTENT`, `--content CONTENT` | Text to append |
| `-n`, `--null` | Append an empty line |
| `-h`, `--help` | Display help |

**Note:** You must use either `-c` or `-n`, not both.

## Examples

Starting with a file containing:

```text
Shopping list
Milk
Bread
```

Run:

```bash
append -p shopping.txt -c "Eggs"
append -p shopping.txt -n
```

The resulting file:

```text
Shopping list
Milk
Bread
Eggs

```

## Requirements

- Ruby 3.x or newer

## License

Apender is released under the MIT License. See [LICENSE.txt](LICENSE.txt).

## Repository

[github.com/Nic24nix/apender](https://github.com/Nic24nix/apender)

---

Made with Ruby 🩷
