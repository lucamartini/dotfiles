# --------------------------
# System-specific Homebrew setup
# --------------------------
system_type=$(uname -s)

if [[ $system_type == "Darwin" ]]; then
  [[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ $system_type == "Linux" ]]; then
  [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# --------------------------
# Locale / UTF-8 environment
# --------------------------
typeset -gx LANG='en_US.UTF-8'
typeset -gx LANGUAGE='en.UTF-8'
typeset -gx LC_CTYPE='en_US.UTF-8'

# --------------------------
# Local override configuration
# --------------------------
[[ -f "$HOME/.local.sh" ]] && source "$HOME/.local.sh"

# --------------------------
# Add local bin directory to PATH
# --------------------------
local_bin="$HOME/.local/bin"
[[ -d $local_bin ]] && export PATH="$PATH:$local_bin"
