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
export FZF_DEFAULT_COMMAND='rg --hidden --files'

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
[ -f ~/.venv/bin/activate ] && source ~/.venv/bin/activate

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

# local class related config (e.g. work or home)
[ -f ~/.local.sh ] && source ~/.local.sh

# OS
# export KERNEL_NAME=$(uname | tr '[:upper:]' '[:lower:]')
# case $KERNEL_NAME in
# 'linux') ;;
# 'darwin') ;;
# *) ;;
# esac

export PATH="$PATH:~/.local/bin"

