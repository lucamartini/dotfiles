# Rosé Pine Dawn theme for zsh-syntax-highlighting
# Palette: https://rosepinetheme.com/palette/ingredients/  (Base #faf4ed, Text #575279, etc.)
# Source this AFTER zsh-syntax-highlighting.

typeset -gA ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[default]='fg=#575279'                      # text (dawn)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#b4637a,bold'           # love (dawn)
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#907aa9,bold'           # iris (dawn)
ZSH_HIGHLIGHT_STYLES[alias]='fg=#56949f'                        # foam (dawn)
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#56949f'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#56949f'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#286983'                      # pine (dawn)
ZSH_HIGHLIGHT_STYLES[function]='fg=#286983'
ZSH_HIGHLIGHT_STYLES[command]='fg=#575279'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#ea9d34'                   # gold (dawn)
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#9893a5'             # muted (dawn)

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ea9d34'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ea9d34'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#d7827e'         # rose (dawn)

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#d7827e'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#d7827e'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#d7827e'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#d7827e'

ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#56949f'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=#56949f'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#b4637a,bold'

ZSH_HIGHLIGHT_STYLES[path]='fg=#797593,underline'              # subtle (dawn)
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#797593,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#907aa9'

ZSH_HIGHLIGHT_STYLES[assign]='fg=#575279'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#797593'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#9893a5,italic'

ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=#b4637a,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=#56949f'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=#907aa9'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=#ea9d34'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=#286983'

ZSH_HIGHLIGHT_STYLES[cursor]='fg=#faf4ed,bg=#907aa9'           # base on iris
