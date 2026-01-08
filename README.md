# Dotfiles Setup Script

Sets up dotfiles with automatic backup and organized directory structure. Existing files are backed up before replacement.

## Usage

- Quick bootstrap (installs tmux via apt-get or Homebrew, then links dotfiles):
  ```bash
  ./bootstrap
  ```
- Link dotfiles only:
  ```bash
  ./makesymlinks
  ```

## Optional configuration

- `BASE_ROOT_DIR`: where backups and managed files live (default: `~/.ng`)
- `DOTFILE_SRC`: source directory for dotfiles (default: repo root)

## Features

- **Automatic TPM installation** if not present
- **Timestamped backups** in `~/.ng/dotfiles/backup/YYYYMMDD_HHMMSS/`

## Directory Structure

- **Source**: `~/Documents/GitHub/dotfiles/`
- **Backups**: `~/.ng/dotfiles/backup/`
- **Target**: `~/.filename` (home root)
