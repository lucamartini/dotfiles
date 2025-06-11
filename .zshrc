# shellcheck disable=SC2148,SC1090,SC1091,SC2296,SC2034
ZSH_DIR="$HOME/.zsh"
REPO_DIR="$ZSH_DIR/repos"

# splash screen
"$ZSH_DIR/doom-neovim.sh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# completions (compinit and plugins should be loaded early)
if [ -f "$ZSH_DIR/comp.zsh" ]; then
  source "$ZSH_DIR/comp.zsh"
fi

# Zsh options for history and behavior
unsetopt share_history         # Don't share command history between sessions
unsetopt autocd                # Require 'cd' to change directories
setopt incappendhistory        # Immediately append history to the history file
setopt hist_reduce_blanks      # Remove superfluous blanks from history items
setopt histignorealldups       # Remove older duplicate entries from history

# Aliases
if command -v eza > /dev/null; then
  alias ls="eza --icons=auto"
  alias ll="eza --long --icons=auto"
else
  alias ls="ls --color=always"
  alias ll="ls -htl"
fi

alias diff="diff --color=always"
alias nc="npm run commit"
alias nca="git add . && nc"
alias pc="pnpm run commit"
alias pca="git add . && pc"
alias tmux='$HOME/.local/bin/tmux'


[[ ! -f $ZSH_DIR/wezterm.sh ]] || source "$ZSH_DIR/wezterm.sh"

# Enable zsh-autosuggestions plugin
if [ -f "$REPO_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$REPO_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Initialize fast Node.js version manager (fnm)
if command -v fnm > /dev/null; then
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell zsh)"
fi

# Set default command for fzf to use ripgrep for file search
if command -v fzf > /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --hidden --files'
  FZF_CTRL_T_COMMAND=source <(fzf --zsh)
fi

# Enable zsh-syntax-highlighting plugins (dracula and default)
# if [ -f "$REPO_DIR/dracula-syntax-highlighting/zsh-syntax-highlighting.sh" ]; then
#   source "$REPO_DIR/dracula-syntax-highlighting/zsh-syntax-highlighting.sh"
# fi
source "$ZSH_DIR/zsh-syntax-highlighting.sh"
if [ -f "$REPO_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$REPO_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

# Key bindings
bindkey -e                        # Use emacs key bindings
bindkey '^[[Z' reverse-menu-complete  # Shift-Tab for reverse menu completion
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-search      # Page Up
bindkey "^[[6~" down-line-or-search    # Page Down

# Remove duplicate entries from $PATH
typeset -U PATH path

# powerlevel10k
source "$REPO_DIR/powerlevel10k/powerlevel10k.zsh-theme"

# yazi
function y() {
	local tmp
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd" || return
	rm -f -- "$tmp"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.p10k_customizations.zsh ]] || source ~/.p10k_customizations.zsh

