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
  fzf-git             glog, gdiff, gtree, fbranch, fstash
  claude-config       claude code env vars
  local-aliases       machine-local aliases (gitignored)

local/                -> ~/.local_*       non-shell configs (gitignored)
  gitconfig           per-machine git user/signing key

local.example/                            tracked templates for local/
```

### How it works

**Root files** are configs apps look for at `~/.X` by convention.

**sourced/** files are auto-prefixed (`sourced_`) when symlinked to prevent
conflicts with app directories (e.g. `~/.claude`, `~/.local`). The zshrc
auto-source loop picks up all `~/.sourced_*` files.

**local/** files are auto-prefixed (`local_`) and gitignored. These are for
non-shell configs consumed by their own tools (e.g. gitconfig via `[include]`).

On first run, `./setup` copies `local.example/*` into `local/` so you have starter
files to edit. Subsequent runs won't overwrite your local configs.

## Features

- **Timestamped backups** in `~/.ng/dotfiles/backup/YYYYMMDD_HHMMSS/`
- **Automatic TPM installation** (tmux plugin manager)
- **fzf helpers** — git log/diff/branch browser, process/port killer, env search
- **tmux copy mode** — vi keys with pbcopy (works correctly in split panes)
- **Git includeIf** — per-directory identity via `local/gitconfig`
