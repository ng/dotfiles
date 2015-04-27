# mysql
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# directories
alias dt='cd ~/Desktop; pwd'

# svn
alias killsvn='find ./ -name ".svn" | xargs rm -Rfv'

# bash
alias ll='ls -la'

# canary
alias canary-unsafe='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --disable-web-security'

# colors
function load_out() {
  echo -n "$(uptime | sed -e "s/.*load average: \(.*\...\), \(.*\...\), \(.*\...\).*/\1/" -e "s/ //g")"
}

function load_color() {
  gray=0
  red=1
  green=2
  yellow=3
  blue=4
  magenta=5
  cyan=6
  white=7

  # Colour progression is important ...
  #   bold gray -> bold green -> bold yellow -> bold red ->
  #   black on red -> bold white on red
  #
  # Then we have to choose the values at which the colours switch, with
  # anything past yellow being pretty important.

  tmp=$(echo $(load_out)*100 | bc)
  let load100=${tmp%.*}

  if [ ${load100} -lt 70 ]
  then
    tput bold ; tput setaf ${gray}
  elif [ ${load100} -ge 70 ] && [ ${load100} -lt 120 ]
  then
    tput bold ; tput setaf ${green}
  elif [ ${load100} -ge 120 ] && [ ${load100} -lt 200 ]
  then
    tput bold ; tput setaf ${yellow}
  elif [ ${load100} -ge 200 ] && [ ${load100} -lt 300 ]
  then
    tput bold ; tput setaf ${red}
  elif [ ${load100} -ge 300 ] && [ ${load100} -lt 500 ]
  then
    tput setaf ${gray} ; tput setab ${red}
  else
    tput bold ; tput setaf ${white} ; tput setab ${red}
  fi
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
export EDITOR='emacs -nw -q'
export CC=/usr/local/bin/gcc-4.2

