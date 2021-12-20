#!/bin/bash

function upgrade_lib () {
  local GREEN=`tput setaf 2`
  local YELLOW=`tput setaf 3 bold`
  local NOCOLOR=`tput sgr0`

  echo -e "going to $YELLOW$1$NOCOLOR"
  cd $1
  for dir in */    
  do
      dir=${dir%*/}
    cd $dir
    echo "upgrading $GREEN$dir$NOCOLOR"
    git pull
    cd ..
  done
}

upgrade_lib ~/.oh-my-zsh/custom/plugins
upgrade_lib ~/.oh-my-zsh/custom/themes
upgrade_lib ~/.tmux/plugins

