#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -N --color=auto'
alias du='cdu -idh'
alias tree='tree --dirsfirst'

alias screenfetch='screenfetch -D "Arch Linux"'
alias scrot='scrot -e "mv \$f ~/images/screenshots/"'

alias please='sudo $(history -p !!)'

export VISUAL=vim
export EDITOR=vim
export PATH=$PATH:$HOME/bin

source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

PS1='\W \[\e[0;34m\]$(__git_ps1 "(%s)") \[\e[0;31m\]»\[\e[0m\] '

