# Dotfiles

Organized dotfile management with automatic backup, namespaced symlinking, and machine-local config support.

## Usage

```bash
# macOS (or already have tmux)
./setup

# Gitpod/Ubuntu (installs tmux first)
./bootstrap
```

### Optional overrides

- `BASE_ROOT_DIR` — where backups live (default: `~/.ng`)
- `DOTFILE_SRC` — dotfiles source directory (default: repo root)

## Structure

```
root/                 -> ~/.filename      app-expected dotfiles (1:1 symlinks)
  aliases, bashrc, zshrc, zprofile, gitconfig, emacs, tmux.conf, ...

sourced/              -> ~/.sourced_*     auto-prefixed, auto-sourced by zshrc
  fzf-config          fzf options, colors, keybinds
  fzf-helpers         fkill, fport, fenv
  git-fzf             glog, gdiff, gtree, fbranch, fstash
  claude-config       claude code env vars

local/                -> ~/.local_*       machine-specific (gitignored)
  aliases             local aliases, env vars
  gitconfig           per-machine git user/signing key

local.example/                            tracked templates for local/
```

### How it works

**Root files** are configs apps look for at `~/.X` by convention.

**sourced/** and **local/** files are auto-prefixed (`sourced_`, `local_`) when
symlinked to prevent conflicts with app directories (e.g. `~/.claude`, `~/.local`).
The zshrc auto-source loop picks up all `~/.sourced_*` and `~/.local_*` files.

On first run, `./setup` copies `local.example/*` into `local/` so you have starter
files to edit. Subsequent runs won't overwrite your local configs.

## Features

- **Timestamped backups** in `~/.ng/dotfiles/backup/YYYYMMDD_HHMMSS/`
- **Automatic TPM installation** (tmux plugin manager)
- **fzf helpers** — git log/diff/branch browser, process/port killer, env search
- **tmux copy mode** — vi keys with pbcopy (works correctly in split panes)
- **Git includeIf** — per-directory identity via `local/gitconfig`
