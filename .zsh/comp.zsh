# Enable command completion system
autoload -Uz compinit
compinit

# Enable menu selection with arrow keys
zstyle ':completion:*' menu select

# Group completions with headers
zstyle ':completion:*' group-name ''

# Enable descriptions for commands, options, etc.
zstyle ':completion:*' format '%F{yellow}-- %d --%f'

# Color completion results
if command -v gdircolors >/dev/null 2>&1; then
  eval "$(gdircolors -b)"
  zstyle ':completion:*' list-colors "${LS_COLORS}"
fi

# Ignore duplicate entries in history based completions
zstyle ':completion:*' ignore-duplicates true

# Cache completions for speed
CACHE_DIR="$HOME/.zsh/cache"
if [ ! -d "$CACHE_DIR" ]; then
  mkdir -p "$CACHE_DIR"
fi
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$CACHE_DIR"

# Allow completion for `cd` across directories
zstyle ':completion:*' completer _complete

# Add tags to help explain what you're completing
# zstyle ':completion:*' verbose yes

# Case-insensitive matching for completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Do not add trailing slash
zstyle ':completion:*' add-space false

# Sort completion results by relevance
zstyle ':completion:*' sort true
