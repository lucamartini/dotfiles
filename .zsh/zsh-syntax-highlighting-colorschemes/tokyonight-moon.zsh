# TokyoNight Moon theme for zsh-syntax-highlighting
# Base  #222436
# Text  #c8d3f5
# https://github.com/folke/tokyonight.nvim

typeset -gA ZSH_HIGHLIGHT_STYLES

# ── Core ───────────────────────────────────────────────
ZSH_HIGHLIGHT_STYLES[default]='fg=#c8d3f5'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff757f,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#c099ff,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#86e1fc'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#86e1fc'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#86e1fc'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#82aaff'
ZSH_HIGHLIGHT_STYLES[function]='fg=#82aaff'
ZSH_HIGHLIGHT_STYLES[command]='fg=#c8d3f5'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#ffc777'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#636da6'

# ── Options / arguments ────────────────────────────────
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ffc777'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ffc777'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#c3e88d'

# ── Strings ────────────────────────────────────────────
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#c3e88d'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#c3e88d'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#c3e88d'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#c3e88d'

# ── Expansions ─────────────────────────────────────────
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#86e1fc'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=#86e1fc'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#ff757f,bold'

# ── Paths / globs ──────────────────────────────────────
ZSH_HIGHLIGHT_STYLES[path]='fg=#a9b8e8,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#a9b8e8,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#c099ff'

# ── Assignments / redirections ─────────────────────────
ZSH_HIGHLIGHT_STYLES[assign]='fg=#c8d3f5'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#a9b8e8'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#636da6,italic'

# ── Brackets ──────────────────────────────────────────
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=#ff757f,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=#86e1fc'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=#c099ff'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=#ffc777'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=#82aaff'

# ── Cursor (buffer highlight) ─────────────────────────
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#222436,bg=#c099ff'
