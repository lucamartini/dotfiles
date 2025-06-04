ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Doom Color Palette (256-color equivalents)
# Dark background:    #1a0f0f
# Bright red:         #ff1e1e
# Orange:             #ff6f1a
# Yellow:             #f8d488
# Brown:              #5c2a2a
# Muted green:        #748b4c
# Cool steel:         #6b8a85
# Pale beige (default): #f1e7dc

# Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6b8a85'

# Functions & Commands
ZSH_HIGHLIGHT_STYLES[alias]='fg=#ff6f1a'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#ff6f1a'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#ff6f1a'
ZSH_HIGHLIGHT_STYLES[function]='fg=#ff6f1a'
ZSH_HIGHLIGHT_STYLES[command]='fg=#ff6f1a'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#ff6f1a,italic'

# Options
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#f8d488,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#f8d488'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#f8d488'

# Backquotes
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#d36cab'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#d36cab'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#d36cab'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#d36cab'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#ff1e1e'

# Built-ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#9fbf4b'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#9fbf4b'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#9fbf4b'

# Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#f070c0'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#f1e7dc'

# Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#ffe680'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#ffe680'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#ffe680'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#ff1e1e'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#ffe680'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#ff1e1e'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#ffe680'

# Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#ff1e1e'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#f1e7dc'

# Misc
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff1e1e'
ZSH_HIGHLIGHT_STYLES[path]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#f070c0'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#f070c0'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#d36cab'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[default]='fg=#f1e7dc'
ZSH_HIGHLIGHT_STYLES[cursor]='standout'