#!/bin/sh

gitdir=$HOME/.dotfiles
remote="git@github.com:etacarinaea/dotfiles.git"

# --mirror copies all refs and doesn't checkout HEAD afterward so the home
# directory won't be overwritten
git clone --mirror $remote $gitdir || exit 1
git --git-dir=$gitdir --work-tree=$HOME config \
  --local status.showUntrackedFiles no

printf "Dotfiles have been succesfully initialised in %s\n" $gitdir
printf "\n\
To continue restart your shell so the new .bashrc is used. After that you can
use \`config\` to interact with the dotfile repo, e.g. \`config status\` or
\`config add .config\`\n"
