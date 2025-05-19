# splash screen
~/misc/doom-neovim.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases
if type eza > /dev/null; then
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

alias tmux="~/.local/bin/tmux"

# lfcd: Integrate lf file manager's cd function if available
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

# Zsh options for history and behavior
unsetopt share_history         # Don't share command history between sessions
unsetopt autocd                # Require 'cd' to change directories
setopt incappendhistory        # Immediately append history to the history file
setopt hist_reduce_blanks      # Remove superfluous blanks from history items
setopt histignorealldups       # Remove older duplicate entries from history

ZSH_DIR=~/.zsh
REPO_DIR=$ZSH_DIR/repos

# completions
source $ZSH_DIR/comp.zsh

# Enable zsh-autosuggestions plugin
source $REPO_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# Initialize fast Node.js version manager (fnm)
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell zsh)"

# Set default command for fzf to use ripgrep for file search
export FZF_DEFAULT_COMMAND='rg --hidden --files'
FZF_CTRL_T_COMMAND= source <(fzf --zsh)

# Enable zsh-syntax-highlighting plugins (dracula and default)
source $REPO_DIR/dracula-syntax-highlighting/zsh-syntax-highlighting.sh
source $REPO_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Key bindings
bindkey -e                        # Use emacs key bindings
bindkey '^[[Z' reverse-menu-complete  # Shift-Tab for reverse menu completion
bindkey -s '^o' 'lfcd\n'              # Ctrl-o to launch lfcd
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-search      # Page Up
bindkey "^[[6~" down-line-or-search    # Page Down


# Remove duplicate entries from $PATH
typeset -U PATH path

# powerlevel10k
source $REPO_DIR/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.p10k_customizations.zsh ]] || source ~/.p10k_customizations.zsh

