# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# ########################
# PATH                   #
# ########################
# HOME
export PATH=~/bin:$PATH
# Amplify
export PATH=~/.amplify/bin:$PATH
# Android
export PATH=~/Library/Android/sdk/platform-tools:$PATH
# Python
export PATH=~/Library/Python/3.9/bin:$PATH

export ANDROID_HOME=~/Library/Android/sdk
export ZSH_TMUX_ITERM2=true
export FZF_DEFAULT_COMMAND='rg --hidden --files'

# set EDITOR
if [ -x "$(command -v nvim)" ]; then
  alias vi="nvim"
  alias vim="nvim"
  export EDITOR=nvim
else
  alias vi="vim"
  export EDITOR=vim
fi

# shell is UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# OS
# export KERNEL_NAME=$(uname | tr '[:upper:]' '[:lower:]')
# case $KERNEL_NAME in
# 'linux') ;;
# 'darwin') ;;
# *) ;;
# esac
