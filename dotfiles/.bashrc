#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

let HISTSIZE=500000

alias vi='vim'

alias fehfeh='feh -dFZr --force-aliasing --keep-zoom-vp --draw-exif --draw-filename --draw-tinted --draw-actions --action1 "cp %F /tmp/" --action2 "mv %F /tmp/" --action3 "gimp %F" --action4 "rsync -aL %F /tmp/" --info "echo cols=%w,rows=%h"'

