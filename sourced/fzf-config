# fzf configuration for zsh
# Source this file from your ~/.zshrc

# Zsh History Settings - Significantly increased for better tracking
export HISTFILE="$HOME/.zsh_history"      # History file location
export HISTSIZE=100000                    # Commands in memory
export SAVEHIST=200000                    # Commands saved to file
setopt EXTENDED_HISTORY                   # Write the history file in the ':start:elapsed;command' format
setopt INC_APPEND_HISTORY                 # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY                      # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST            # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS                   # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS              # Delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS                 # Do not display a previously found event
setopt HIST_IGNORE_SPACE                 # Do not record an event starting with a space
setopt HIST_SAVE_NO_DUPS                 # Do not write a duplicate event to the history file
setopt HIST_VERIFY                       # Do not execute immediately upon history expansion
setopt HIST_REDUCE_BLANKS                # Remove superfluous blanks from each command line

# Create fzf history file if it doesn't exist (do this FIRST)
[[ ! -f "$HOME/.fzf_history" ]] && touch "$HOME/.fzf_history"

# Add fzf to PATH first (prioritize over system fzf)
if [[ -d "$HOME/.fzf/bin" ]] && [[ ! "$PATH" == *"$HOME/.fzf/bin"* ]]; then
    export PATH="$HOME/.fzf/bin:$PATH"
fi

# Source fzf key bindings and completion (supports brew install too)
if command -v brew >/dev/null 2>&1; then
    _fzf_prefix="$(brew --prefix fzf 2>/dev/null)"
    if [[ -n "$_fzf_prefix" ]]; then
        [ -f "$_fzf_prefix/shell/key-bindings.zsh" ] && source "$_fzf_prefix/shell/key-bindings.zsh"
        [ -f "$_fzf_prefix/shell/completion.zsh" ] && source "$_fzf_prefix/shell/completion.zsh"
    fi
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf default options with preview and extended history
# Note: Using double quotes for $HOME expansion, escape internal quotes as needed
export FZF_DEFAULT_OPTS="
  --height 60%
  --layout=reverse
  --border
  --inline-info
  --preview-window=right:50%:wrap
  --bind=ctrl-u:preview-page-up,ctrl-d:preview-page-down
  --bind=ctrl-/:toggle-preview
  --history=$HOME/.fzf_history
  --history-size=100000
  --color=fg:#d0d0d0,bg:#121212,hl:#5f87af
  --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff
  --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
  --color=marker:#87ff00,spinner:#af5fff,header:#87afaf
"

# Use fd for fzf if available (faster than find)
if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# Use ripgrep for fzf if available
if command -v rg >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
fi

# File preview for Ctrl+T (file search)
export FZF_CTRL_T_OPTS="
  --preview 'bat --style=numbers --color=always --line-range :500 {} 2>/dev/null || cat {} 2>/dev/null || tree -C {} 2>/dev/null'
  --bind 'ctrl-/:toggle-preview'
  --preview-window=right:60%:wrap
"

# Directory preview for Alt+C (cd into directory)
export FZF_ALT_C_OPTS="
  --preview 'tree -C {} | head -200'
  --bind 'ctrl-/:toggle-preview'
"

# Enhanced Ctrl+R for command history with preview
export FZF_CTRL_R_OPTS="
  --preview 'echo {}'
  --preview-window=down:3:wrap
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header 'Press Ctrl-Y to copy command into clipboard'
  --exact
"
