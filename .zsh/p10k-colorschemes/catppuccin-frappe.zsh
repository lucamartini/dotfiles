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

# VCS base
typeset -g POWERLEVEL9K_VCS_FOREGROUND='#c6d0f5'       # text
typeset -g POWERLEVEL9K_VCS_BACKGROUND='#303446'       # base

# VCS states (pop)
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='#303446'       # base
typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='#a6d189'       # green
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='#303446'    # base
typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='#e5c890'    # yellow
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='#303446'   # base
typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='#99d1db'   # sky
typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND='#303446'  # base
typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND='#e78284'  # red
typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND='#8caaee'     # blue

# VCS ahead/behind + branch icon
typeset -g POWERLEVEL9K_VCS_COMMITS_AHEAD_FOREGROUND='#8caaee'   # blue
typeset -g POWERLEVEL9K_VCS_COMMITS_BEHIND_FOREGROUND='#8caaee'  # blue
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON_FOREGROUND='#303446'      # base
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON_VISUAL_IDENTIFIER_COLOR='#303446'
typeset -g POWERLEVEL9K_VCS_CLEAN_VISUAL_IDENTIFIER_COLOR='#303446'
typeset -g POWERLEVEL9K_VCS_MODIFIED_VISUAL_IDENTIFIER_COLOR='#303446'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_VISUAL_IDENTIFIER_COLOR='#303446'
typeset -g POWERLEVEL9K_VCS_CONFLICTED_VISUAL_IDENTIFIER_COLOR='#303446'
