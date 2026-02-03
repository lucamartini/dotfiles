# ── Catppuccin Macchiato (rebalanced for readability) ────────────
# base #24273a | surface0 #363a4f | surface1 #494d64 | surface2 #5b6078 | text #cad3f5
# mauve #c6a0f6 | sky #91d7e3 | blue #8aadf4 | green #a6da95 | yellow #eed49f | red #ed8796

# OS icon
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND='#c6a0f6'   # mauve
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND='#24273a'   # base

# DIR (readable on mauve bg)
typeset -g POWERLEVEL9K_DIR_BACKGROUND='#c6a0f6'       # mauve
typeset -g POWERLEVEL9K_DIR_FOREGROUND='#494d64'       # surface1 (clearer than base)
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND='#5b6078'  # surface2 (softer)
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND='#363a4f'     # surface0 (darker anchor)

# TIME (calm info)
typeset -g POWERLEVEL9K_TIME_FOREGROUND='#91d7e3'      # sky
typeset -g POWERLEVEL9K_TIME_BACKGROUND='#24273a'      # base

# VCS base
typeset -g POWERLEVEL9K_VCS_FOREGROUND='#cad3f5'       # text
typeset -g POWERLEVEL9K_VCS_BACKGROUND='#24273a'       # base

# VCS states (pop)
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='#24273a'       # base
typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='#a6da95'       # green
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='#24273a'    # base
typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='#eed49f'    # yellow
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='#24273a'   # base
typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='#91d7e3'   # sky
typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND='#24273a'  # base
typeset -g POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND='#ed8796'  # red
typeset -g POWERLEVEL9K_VCS_LOADING_BACKGROUND='#8aadf4'     # blue

# VCS ahead/behind + branch icon
typeset -g POWERLEVEL9K_VCS_COMMITS_AHEAD_FOREGROUND='#8aadf4'   # blue
typeset -g POWERLEVEL9K_VCS_COMMITS_BEHIND_FOREGROUND='#8aadf4'  # blue
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON_FOREGROUND='#24273a'      # base
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON_VISUAL_IDENTIFIER_COLOR='#24273a'
typeset -g POWERLEVEL9K_VCS_CLEAN_VISUAL_IDENTIFIER_COLOR='#24273a'
typeset -g POWERLEVEL9K_VCS_MODIFIED_VISUAL_IDENTIFIER_COLOR='#24273a'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_VISUAL_IDENTIFIER_COLOR='#24273a'
typeset -g POWERLEVEL9K_VCS_CONFLICTED_VISUAL_IDENTIFIER_COLOR='#24273a'
