# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"
# Set PATH, MANPATH, etc., for Homebrew.
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
  if command -v /opt/homebrew/bin/brew &>/dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
elif [ "$system_type" = "Linux" ]; then
  if command -v /home/linuxbrew/.linuxbrew/bin/brew &>/dev/null; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi

# ########################
# PATH                   #
# ########################
# HOME
export PATH=~/bin:$PATH
# Amplify
export PATH=~/.amplify/bin:$PATH
# Android
export PATH=~/Library/Android/sdk/platform-tools:$PATH

export ANDROID_HOME=~/Library/Android/sdk
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
export ZSH_TMUX_ITERM2=true
export FZF_DEFAULT_COMMAND='rg --hidden --files'
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

# set EDITOR
if [ -x "$(command -v nvim)" ]; then
  alias vi="nvim"
  alias vim="nvim"
  export EDITOR=vim
else
  alias vi="vim"
  export EDITOR=vim
fi

# shell is UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# local class related config (e.g. work or home)
[ -f ~/.local.sh ] && source ~/.local.sh

# OS
# export KERNEL_NAME=$(uname | tr '[:upper:]' '[:lower:]')
# case $KERNEL_NAME in
# 'linux') ;;
# 'darwin') ;;
# *) ;;
# esac

# Created by `pipx` on 2024-02-14 08:46:05
export PATH="$PATH:/Users/lmartini/.local/bin"

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
