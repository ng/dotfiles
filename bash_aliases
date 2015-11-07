alias dt='cd ~/Desktop; pwd'

alias killsvn='find ./ -name ".svn" | xargs rm -Rfv'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# canary
alias canary-unsafe='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --disable-web-security'

# Fix empty Sublime windows
alias edit='subl && sleep 0.1 && subl'