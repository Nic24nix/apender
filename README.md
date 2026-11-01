# Apender

**A simple Ruby CLI tool to append content to existing files and edit specific lines.**

Apender is a lightweight command-line utility written in Ruby. It allows you to append text or empty lines to files, replace specific lines, and add content to existing lines without overwriting the rest of the file.

## Features

- Append text to existing files.
- Append empty lines.
- Replace content on specific lines.
- Add content to existing lines without replacing their contents.
- Automatically create missing lines when targeting a line beyond the end of a file.
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
gem install --user-install ./apender-0.2.0.gem
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

### Replace a specific line

```bash
append -p ~/notes.txt -c "New content" -l 3
```

This replaces the content of line 3.

### Add content to an existing line

```bash
append -p ~/notes.txt -c " More text" -l 1 -a
```

This adds content to the end of line 1 without replacing its existing content.

### Display help

```bash
append --help
```

## Options

| Option | Description |
|---|---|
| `-p PATH`, `--path PATH` | Path to the existing file |
| `-c CONTENT`, `--content CONTENT` | Text to write |
| `-n`, `--null` | Append an empty line |
| `-l LINE`, `--line LINE` | Select a specific line |
| `-a`, `--add` | Add content to an existing line |
| `-h`, `--help` | Display help |

**Note:** You must use either `-c` or `-n`, not both. `-a` requires `-l`, and `-n` cannot be combined with `-l`.

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
append -p shopping.txt -c "Butter" -l 3
append -p shopping.txt -c " Shopping" -l 1 -a
```

The resulting file:

```text
Shopping list Shopping
Milk
Butter
Eggs

```

## Requirements

- Ruby 3.2 or newer

## License

Apender is released under the MIT License. See [LICENSE.txt](LICENSE.txt).

## Repository

[github.com/Nic24nix/apender](https://github.com/Nic24nix/apender)

---

Made with Ruby 🩷
