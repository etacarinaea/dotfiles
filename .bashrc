#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias screenfetch='screenfetch -D "Arch Linux"'
alias scrot='scrot -e "mv \$f ~/images/screenshots/"'

export VISUAL=vim
export EDITOR=vim
export PATH=$PATH:$HOME/bin

PS1='\W » '
