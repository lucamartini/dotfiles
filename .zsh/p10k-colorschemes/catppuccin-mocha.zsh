# ── Catppuccin Mocha (rebalanced for readability) ─────────────────
# base #1e1e2e | surface0 #313244 | surface1 #45475a | surface2 #585b70 | text #cdd6f4
# mauve #cba6f7 | sky #89dceb | blue #89b4fa | green #a6e3a1 | yellow #f9e2af | red #f38ba8

# OS icon
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND='#cba6f7'   # mauve
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND='#1e1e2e'   # base

# DIR (readable on mauve bg)
typeset -g POWERLEVEL9K_DIR_BACKGROUND='#cba6f7'       # mauve
typeset -g POWERLEVEL9K_DIR_FOREGROUND='#45475a'       # surface1 (clearer than base)
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND='#585b70'  # surface2 (softer)
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND='#313244'     # surface0 (darker anchor)

# TIME (calm info)
typeset -g POWERLEVEL9K_TIME_FOREGROUND='#89dceb'      # sky
typeset -g POWERLEVEL9K_TIME_BACKGROUND='#1e1e2e'      # base

# VCS base
typeset -g POWERLEVEL9K_VCS_FOREGROUND='#cdd6f4'       # text
typeset -g POWERLEVEL9K_VCS_BACKGROUND='#1e1e2e'       # base

# VCS states (pop)
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='#1e1e2e'       # base
typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='#a6e3a1'       # green
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='#1e1e2e'    # base
typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='#f9e2af'    # yellow
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='#1e1e2e'   # base
typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='#89dceb'   # sky
typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND='#1e1e2e'  # base
typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND='#f38ba8'  # red
typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND='#89b4fa'     # blue

# VCS ahead/behind + branch icon
typeset -g POWERLEVEL9K_VCS_COMMITS_AHEAD_FOREGROUND='#89b4fa'   # blue
typeset -g POWERLEVEL9K_VCS_COMMITS_BEHIND_FOREGROUND='#89b4fa'  # blue
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON_FOREGROUND='#1e1e2e'      # base
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON_VISUAL_IDENTIFIER_COLOR='#1e1e2e'
typeset -g POWERLEVEL9K_VCS_CLEAN_VISUAL_IDENTIFIER_COLOR='#1e1e2e'
typeset -g POWERLEVEL9K_VCS_MODIFIED_VISUAL_IDENTIFIER_COLOR='#1e1e2e'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_VISUAL_IDENTIFIER_COLOR='#1e1e2e'
typeset -g POWERLEVEL9K_VCS_CONFLICTED_VISUAL_IDENTIFIER_COLOR='#1e1e2e'
