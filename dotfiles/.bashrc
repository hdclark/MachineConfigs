#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

let HISTSIZE=500000
let HISTFILESIZE=500000

alias vi='vim'

alias fehfeh='feh -dFZr --force-aliasing --keep-zoom-vp --draw-exif --draw-filename --draw-tinted --draw-actions --action1 "cp %F /tmp/" --action2 "mv %F /tmp/" --action3 "gimp %F" --action4 "rsync -aL %F /tmp/" --info "echo cols=%w,rows=%h"'

alias dcma='LIBGL_ALWAYS_SOFTWARE=1 dicomautomaton_dispatcher'

# Generate with `pip3 install yt-dlp`
alias youtube-dl='pip3 install yt-dlp ; /home/hal/.local/bin/yt-dlp'
alias ytdlp='pip3 install yt-dlp ; /home/hal/.local/bin/yt-dlp'

