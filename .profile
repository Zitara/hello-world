# Make ls use colors
export CLICOLOR=1
alias ls='ls -Fa'

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

# ~/.bash_aliases
# ls variants
#alias l='ls -CF'
alias la='ls -A'
alias l='ls -alFtr'
alias lsd='ls -d .*'
# Various
alias h='history | tail'
alias hg='history | grep'
alias mv='mv -i'
alias zap='rm -i'
# One letter quickies:
alias p='pwd'
alias x='exit'
alias {ack,ak}='ack-grep'
# Directories
alias s='cd ..'
alias play='cd ~/play/'
# Rails
alias src='script/rails console'
alias srs='script/rails server'
alias raked='rake db:drop db:create db:migrate db:seed'
alias rvm-restart='source '\''/home/durrantm/.rvm/scripts/rvm'\'''
alias rrg='rake routes | grep '
alias rspecd='rspec --drb '
#
# DropBox - syncd
WORKBASE="~/Dropbox/97_2012/work"
alias work="cd $WORKBASE"
alias code="cd $WORKBASE/ror/code"
#
# DropNot - NOT syncd !
WORKBASE_GIT="~/Dropnot"
alias {dropnot,not}="cd $WORKBASE_GIT"
alias {webs,ww}="cd $WORKBASE_GIT/webs"
alias {setups,docs}="cd $WORKBASE_GIT/setups_and_docs"
alias {linker,lnk}="cd $WORKBASE_GIT/webs/rails_v3/linker"
#
# git
alias {gsta,gst}='git status'
# Warning: gst conflicts with gnu-smalltalk (when used).
alias {gbra,gb}='git branch'
alias {gco,go}='git checkout'
alias {gcob,gob}='git checkout -b '
alias {gadd,ga}='git add '
alias {gcom,gc}='git commit'
alias {gpul,gl}='git pull '
alias {gpus,gh}='git push '
alias glom='git pull origin master'
alias ghom='git push origin master'
alias gg='git grep '
#
# vim
alias v='vim'
#
# tmux
alias {ton,tn}='tmux set -g mode-mouse on'
alias {tof,tf}='tmux set -g mode-mouse off'
#
# dmc
alias {dmc,dm}='cd ~/Dropnot/webs/rails_v3/dmc/'
alias wf='cd ~/Dropnot/webs/rails_v3/dmc/dmWorkflow'
alias ws='cd ~/Dropnot/webs/rails_v3/dmc/dmStaffing'

# Blender
alias blender="/Applications/blender-2.78c-OSX_10.6-x86_64/blender.app/Contents/MacOS/blender"
export PYTHONPATH=~/project/blender/build_darwin_bpy/bin/:$PYTHONPATH

# set your prompt
export PS1="\n$C_LIGHTGREEN\u$C_DARKGRAY@$C_BLUE\h $C_DARKGRAY: $C_LIGHTYELLOW\w\n$C_DARKGRAY\$$C_DEFAULT "

# MacPorts Installer addition on 2017-07-27_at_09:52:47: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# added by Anaconda3 4.4.0 installer
#export PATH="~/anaconda3/bin:$PATH"

# BRL-CAD
#export BRLCAD_HOME="/usr/local/brlcad"
#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/brlcad/lib
export PATH="/usr/local/brlcad/bin:$PATH"

alias mvim="/Applications/MacPorts/MacVim.app/Contents/bin/vim"

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# SU2
export SU2_RUN="/usr/local/SU2/bin"
export SU2_HOME="/Users/Zitar/project/SU2-6.0.0"
export PATH=$PATH:$SU2_RUN
export PYTHONPATH=$PYTHONPATH:$SU2_RUN

# Android SDK Emulator porblem on mac
#function emulator { cd "$(dirname "$(which emulator)")" && ./emulator "$@"; }

# bash-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi
