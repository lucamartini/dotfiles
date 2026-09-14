color-theme() {
  local theme="${1:?usage: $0 <theme>}"

  # Per-app theme names (defaults to the input if not mapped)
  local ghostty_theme="$theme"
  local nvim_theme="$theme"
  local zsh_theme="$theme"

  case "$theme" in
    catppuccin-frappe)
      ghostty_theme="Catppuccin Frappe"
      zsh_theme="catppuccin-frappe"
      nvim_theme="catppuccin-frappe"
      ;;
    catppuccin-latte)
      ghostty_theme="Catppuccin Latte"
      zsh_theme="catppuccin-latte"
      nvim_theme="catppuccin-latte"
      ;;
    catppuccin-macchiato)
      ghostty_theme="Catppuccin Macchiato"
      zsh_theme="catppuccin-macchiato"
      nvim_theme="catppuccin-macchiato"
      ;;
    catppuccin-mocha)
      ghostty_theme="Catppuccin Mocha"
      zsh_theme="catppuccin-mocha"
      nvim_theme="catppuccin-mocha"
      ;;
    rose-pine)
      ghostty_theme="Rose Pine"
      zsh_theme="rose-pine"
      nvim_theme="rose-pine"
      ;;
    rose-pine-dawn)
      ghostty_theme="Rose Pine Dawn"
      zsh_theme="rose-pine-dawn"
      nvim_theme="rose-pine-dawn"
      ;;
    rose-pine-moon)
      ghostty_theme="Rose Pine Moon"
      zsh_theme="rose-pine-moon"
      nvim_theme="rose-pine-moon"
      ;;
    tokyonight)
      ghostty_theme="TokyoNight"
      zsh_theme="tokyonight-night"
      nvim_theme="tokyonight-night"
      ;;
    tokyonight-day)
      ghostty_theme="TokyoNight Day"
      zsh_theme="tokyonight-day"
      nvim_theme="tokyonight-day"
      ;;
    tokyonight-storm)
      ghostty_theme="TokyoNight Storm"
      zsh_theme="tokyonight-storm"
      nvim_theme="tokyonight-storm"
      ;;
    tokyonight-moon)
      ghostty_theme="TokyoNight Moon"
      zsh_theme="tokyonight-moon"
      nvim_theme="tokyonight-moon"
      ;;
    dracula)
      ghostty_theme="Dracula"
      zsh_theme="dracula"
      nvim_theme="dracula"
      ;;
    *)
      # leave defaults
      ;;
  esac

  # Files
  local ZSHRC="${ZSHRC:-$HOME/.zshrc}"
  local GHOSTTY="${GHOSTTY:-$HOME/.config/ghostty/config.ghostty}"
  local NVIM_COLORS="${NVIM_COLORS:-$HOME/.config/nvim/lua/plugins/colorscheme.lua}"

  mkdir -p "$(dirname "$GHOSTTY")"
  touch "$GHOSTTY"

  sed -i '' -E "s|(zsh-syntax-highlighting-colorschemes/)[^/]+|\\1${zsh_theme}.zsh|" "$ZSHRC"
  sed -i '' -E "s|p10k-colorschemes/[^\"]+\.zsh|p10k-colorschemes/${zsh_theme}.zsh|g" "$ZSHRC"
  # source "$ZSHRC"

  sed -i '' -E "s|^(theme = )(.*)$|\\1${ghostty_theme}|" "$GHOSTTY"

  sed -i '' -E "s|^([[:space:]]*colorscheme[[:space:]]*=[[:space:]]*\")[^\"]+(\"[[:space:]]*,)|\\1${nvim_theme}\\2|" "$NVIM_COLORS"

  print "✅ Theme switched to: ${theme}"
  print "   - ${ZSHRC}"
  print "   - ${GHOSTTY}"
  print "   - ${NVIM_COLORS}"
}

# Completion
_color-theme() {
  emulate -L zsh
  setopt extendedglob

  local def line key
  local -a candidates

  def="$(functions color-theme 2>/dev/null)" || return 1
  [[ -n "$def" ]] || return 1

  for line in ${(f)def}; do
    # Match: (catppuccin-frappe) ...   or   (dracula) ...
    if [[ "$line" == (#b)[[:space:]]##\(([A-Za-z0-9._-]##)\)* ]]; then
      key="${match[1]}"
      [[ "$key" == "*" ]] && continue
      candidates+=("$key")
    fi
  done

  candidates=("${(@u)candidates}")
  (( ${#candidates} )) || return 1

  _describe -t themes 'themes' candidates
}
compdef _color-theme color-theme
