source ~/.aliases

# OpenSSL
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# NPM
export PATH=~/.npm-global/bin:$PATH

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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
