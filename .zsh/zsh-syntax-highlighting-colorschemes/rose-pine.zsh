# Rosé Pine (main) theme for zsh-syntax-highlighting
# Palette: https://rosepinetheme.com/palette/ingredients/  (Base #191724, Text #e0def4, etc.)
# Source this AFTER zsh-syntax-highlighting.

typeset -gA ZSH_HIGHLIGHT_STYLES

# Core
ZSH_HIGHLIGHT_STYLES[default]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#eb6f92,bold'          # love
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#c4a7e7,bold'          # iris
ZSH_HIGHLIGHT_STYLES[alias]='fg=#9ccfd8'                       # foam
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#9ccfd8'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#9ccfd8'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#31748f'                     # pine
ZSH_HIGHLIGHT_STYLES[function]='fg=#31748f'
ZSH_HIGHLIGHT_STYLES[command]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#f6c177'                  # gold
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#6e6a86'             # muted

# Options / args
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#f6c177'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#f6c177'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#ebbcba'         # rose

# Strings
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#ebbcba'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#ebbcba'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#ebbcba'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#ebbcba'

# Substitutions / expansions
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#9ccfd8'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=#9ccfd8'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#eb6f92,bold'

# Paths / globs
ZSH_HIGHLIGHT_STYLES[path]='fg=#908caa,underline'              # subtle
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#908caa,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#c4a7e7'

# Assignments / redirections
ZSH_HIGHLIGHT_STYLES[assign]='fg=#e0def4'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#908caa'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6e6a86,italic'

# Brackets / braces / parentheses
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=#eb6f92,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=#9ccfd8'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=#c4a7e7'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=#f6c177'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=#31748f'

# Cursor (buffer being edited)
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#191724,bg=#c4a7e7'           # base on iris
