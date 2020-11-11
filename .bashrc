#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

source <(kitty + complete setup bash)

source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

HISTSIZE=5000
HISTFILESIZE=5000

alias ls='ls -N --color=auto'
alias cdu='cdu -idh'
alias tree='tree -C --dirsfirst -I ".git|node_modules|public|build"'
alias ctx='grep -TnrC 1'

alias screenfetch='screenfetch -D "Arch Linux"'
alias scrot='scrot -e "xclip -t image/png -selection clipboard \$f && mv \$f ~/images/screenshots/"'
alias sst='maim -s --noopengl --hidecursor | tee >(xclip -t image/png -selection clipboard) >~/images/screenshots/$(date +%F-%N)_maim.png'

alias please='sudo $(history -p !!)'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export VISUAL=vim
export EDITOR=vim
export PATH=$PATH:$HOME/scripts:$HOME/.local/bin


PS1=' '
EMPS1='\[\e[48;2;46;47;61m\] \W\[\e[0;34m\e[48;2;46;47;61m\]$(__git_ps1 " - %s")'
PROMPT_EVEN=true
mode_string () {
  SEPARATOR=' '
  if [ "$PROMPT_EVEN" = true ]; then
    SEPARATOR=''
    PROMPT_EVEN=false
  else
    SEPARATOR=''
    PROMPT_EVEN=true
  fi
  PROMPT_COUNTER=$((PROMPT_COUNTER + 1))
  INSCOL='\[\e[1;35m\]'
  CMDCOL='\[\e[1;34m\]'
  BGCOL='\[\e[0m\e[38;2;46;47;61m\]'
  RESETCOL='\[\e[0m\]'
  bind "set vi-ins-mode-string \"${INSCOL@P}${EMPS1@P}${INSCOL@P} » ${BGCOL@P}${SEPARATOR}${RESETCOL@P}\""
  bind "set vi-cmd-mode-string \"${CMDCOL@P}${EMPS1@P}${CMDCOL@P} » ${BGCOL@P}${SEPARATOR}${RESETCOL@P}\""
}
PROMPT_COMMAND=mode_string
# if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#   PS1='\[\e[0;35m\]\u@\h\[\e[0m\] '
# fi
# PS1+='\W\[\e[0;34m\]$(__git_ps1 " (%s)") \[\e[0;35m\]»\[\e[0m\] '

