# Dotfiles Setup Script

Sets up dotfiles with automatic backup and organized directory structure. Existing files are backed up before replacement.

## Usage

```bash
./makesymlinks
```

## Features

- **Automatic TPM installation** if not present
- **Timestamped backups** in `~/.ng/dotfiles/backup/YYYYMMDD_HHMMSS/`

## Directory Structure

- **Source**: `~/Documents/GitHub/dotfiles/`
- **Backups**: `~/.ng/dotfiles/backup/`
- **Target**: `~/.filename` (home root)
