source ~/.aliases
source ~/.local

# zsh history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY # following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# gpg
export GPG_TTY=$(tty)

# OpenSSL
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"

# NPM
export PATH=~/.npm-global/bin:$PATH

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Heroku: autocomplete
HEROKU_AC_ZSH_SETUP_PATH=/Users/ng/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
eval "$(pyenv init -)"

# # Show Git branch
## Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

## Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

## Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n@%T: %F{blue}%1~%F{green}[${vcs_info_msg_0_}]%F{white}$ '

# pnpm
export PNPM_HOME="$HOME/.pnpm-global"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end