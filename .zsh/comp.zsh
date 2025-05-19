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
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache

# Allow completion for `cd` across directories
zstyle ':completion:*' completer _complete _approximate

# Add tags to help explain what you're completing
zstyle ':completion:*' verbose yes

# Case-insensitive and smart matching for completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'

# Add trailing slash to directory completions
zstyle ':completion:*' add-space false

# Sort completion results by relevance
zstyle ':completion:*' sort true
