# shellcheck disable=SC2148,SC1007,SC1090,SC1091,SC2296,SC2034
ZSH_DIR="$HOME/.zsh"
WEZTERM_DIR="$HOME/.config/wezterm"
REPO_DIR="$ZSH_DIR/repos"

# splash screen
# "$ZSH_DIR/welcome-doom.sh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# completions
if [ -f "$ZSH_DIR/comp.zsh" ]; then
  source "$ZSH_DIR/comp.zsh"
fi

# options
unsetopt autocd                # Require 'cd' to change directories
# history
unsetopt share_history         # Don't share command history between sessions
setopt incappendhistory        # Immediately append history to the history file
setopt hist_reduce_blanks      # Remove superfluous blanks from history items
setopt histignorealldups       # Remove older duplicate entries from history
export SAVEHIST=100000         # number of commands saved to history file

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

if command -v nvim >/dev/null; then
  alias vi='nvim'
  alias vim='nvim'
  export EDITOR='nvim'
else
  alias vi='vim'
  export EDITOR='vim'
fi

if [ -f "$WEZTERM_DIR/wezterm.sh" ]; then
  source "$WEZTERM_DIR/wezterm.sh"
fi

if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

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
  FZF_CTRL_T_COMMAND= source <(fzf --zsh)
fi

# Enable zsh-syntax-highlighting plugins (dracula and default)
local SYNTAX_THEME=$REPO_DIR/dracula-syntax-highlighting/zsh-syntax-highlighting.sh
# local SYNTAX_THEME=$ZSH_DIR/zsh-syntax-highlighting-colorschemes/doom.zsh # doom
if [ -f "$SYNTAX_THEME" ]; then
  source "$SYNTAX_THEME"
fi
if [ -f "$REPO_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$REPO_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi


# Enable AWS profile management
if [ -f "$ZSH_DIR/aws_export_profile.zsh" ]; then
  source "$ZSH_DIR/aws_export_profile.zsh"
fi

# Key bindings
bindkey -e                        # Use emacs key bindings
bindkey '^[[Z' reverse-menu-complete  # Shift-Tab for reverse menu completion
bindkey "^[[1~" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-search      # Page Up
bindkey "^[[6~" down-line-or-search    # Page Down
autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # Up arrow search in history
bindkey '^P' up-line-or-beginning-search   # Up arrow search in history
autoload -Uz down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search # Down arrow search in history
bindkey '^N' down-line-or-beginning-search # Down arrow search in history

# Remove duplicate entries from $PATH
typeset -U PATH path

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"

# powerlevel10k
source "$REPO_DIR/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.p10k_customizations.zsh ]] || source ~/.p10k_customizations.zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
