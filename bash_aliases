alias dt='cd ~/Desktop; pwd'

alias killsvn='find ./ -name ".svn" | xargs rm -Rfv'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Create an animated GIF from a video. Requires ffmpeg.
function video2gif() {
  input=$1 && ffmpeg -y -i $input -vf fps=10,scale=320:-1:flags=lanczos,palettegen "$input-palette.png" && ffmpeg -y -i $input -i "$input-palette.png" -loop -1 -filter_complex "fps=10,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" "$input.gif"
  rm $input-palette.png
}

# canary
alias canary-unsafe='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --disable-web-security'

# Fix empty Sublime windows
alias edit='subl && sleep 0.1 && subl'

function mountAndroid {
  hdiutil attach ~/android.dmg.sparseimage -mountpoint /Volumes/android
}
