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

LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n'

# history settings
unsetopt share_history
unsetopt autocd
setopt incappendhistory
setopt hist_reduce_blanks

# bindings
bindkey "^T" transpose-chars

# zsh-autosuggestions
source ~/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fast node version manager
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --resolve-engines --shell zsh)"

# fzf
export FZF_DEFAULT_COMMAND='rg --hidden --files'
source <(fzf --zsh)

# zsh zsh-syntax-highlighting
source ~/zsh/dracula-syntax-highlighting/zsh-syntax-highlighting.sh
source ~/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# completions
autoload -Uz compinit
compinit

# remove duplicated entries from $PATH
typeset -U PATH path

# POWERLEVEL9K_MODE='nerdfont-complete'
source ~/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.p10k_customizations.zsh ]] || source ~/.p10k_customizations.zsh

