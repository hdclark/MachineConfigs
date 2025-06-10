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
#alias youtube-dl='pip3 install yt-dlp ; /home/hal/.local/bin/yt-dlp'
#alias ytdlp='pip3 install yt-dlp ; /home/hal/.local/bin/yt-dlp'
alias youtube-dl='python3 -m venv /tmp/ytdlp_venv ; /tmp/ytdlp_venv/bin/pip3 install yt-dlp ; /tmp/ytdlp_venv/bin/yt-dlp'
alias ytdlp='python3 -m venv /tmp/ytdlp_venv ; /tmp/ytdlp_venv/bin/pip3 install yt-dlp ; /tmp/ytdlp_venv/bin/yt-dlp'
alias gopro2gpx='python3 -m venv /tmp/ytdlp_venv ; /tmp/ytdlp_venv/bin/pip3 install git+https://github.com/juanmcasillas/gopro2gpx ; /tmp/ytdlp_venv/bin/gopro2gpx'

#alias freecad='/media/sf_U_DRIVE/Progs/FreeCAD_0.20.2-2022-12-27-conda-Linux-x86_64-py310.AppImage'
#alias pandoc='/home/hal/Scratch/20230828_pandoc_nightly/pandoc'
#alias libreoffice='/home/hal/Scratch/LibreOffice-still.basic-x86_64.AppImage'

