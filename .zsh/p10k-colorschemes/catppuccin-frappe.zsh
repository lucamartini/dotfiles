# ── Catppuccin Frappé (rebalanced for readability) ───────────────
# Key tones:
#   base     #303446  (main background)
#   surface0 #414559  (darker surface)
#   surface1 #51576d  (readable on bright accents)
#   surface2 #626880  (softer than surface1)
#   text     #c6d0f5
#   mauve    #ca9ee6
#   sky      #99d1db

# OS icon: keep it “signature Catppuccin” but not screaming
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND='#ca9ee6'   # mauve
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND='#303446'   # base

# DIR: improved readability (this is the main fix)
typeset -g POWERLEVEL9K_DIR_BACKGROUND='#ca9ee6'       # mauve
typeset -g POWERLEVEL9K_DIR_FOREGROUND='#51576d'       # surface1 (much clearer than base)

# DIR shortened/anchor: stay readable on mauve bg, with subtle hierarchy
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND='#626880'  # surface2 (slightly softer)
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND='#414559'     # surface0 (darker = anchor stands out)

# TIME: informational + harmonious (cool accent, low noise)
typeset -g POWERLEVEL9K_TIME_FOREGROUND='#99d1db'      # sky
typeset -g POWERLEVEL9K_TIME_BACKGROUND='#303446'      # base
