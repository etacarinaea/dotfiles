#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -N --color=auto'
alias du='cdu -idh'
alias tree='tree -C --dirsfirst -I ".git|node_modules"'
alias ctx='grep -TnrC 1'

alias screenfetch='screenfetch -D "Arch Linux"'
alias scrot='scrot -e "xclip -t image/png -selection clipboard \$f && mv \$f ~/images/screenshots/"'

alias please='sudo $(history -p !!)'

export VISUAL=vim
export EDITOR=vim
export PATH=$PATH:$HOME/bin:$(ruby -e 'print Gem.user_dir')/bin

source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

PS1='\W\[\e[0;34m\]$(__git_ps1 " (%s)") \[\e[0;31m\]»\[\e[0m\] '

