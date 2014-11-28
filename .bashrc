#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias screenfetch='screenfetch -D "Arch Linux"'

# default: PS1='[\u@\h \W]\$ '
PS1='\W » '
