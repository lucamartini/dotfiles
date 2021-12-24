#!/bin/bash

function upgrade_lib () {
  local GREEN=`tput setaf 2 bold`
  local YELLOW=`tput setaf 3 bold`
  local NOCOLOR=`tput sgr0`

  echo -e "going to $YELLOW$1$NOCOLOR"
  cd $1
  for dir in */    
  do
    local local_dir=${dir%*/}
    cd $local_dir
    echo "upgrading $GREEN$local_dir$NOCOLOR"
    git pull
    cd ..
  done
}

upgrade_lib ~/.oh-my-zsh/custom/plugins
upgrade_lib ~/.oh-my-zsh/custom/themes
upgrade_lib ~/.tmux/plugins

(
  cd "$NVM_DIR"
  git fetch --tags origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
