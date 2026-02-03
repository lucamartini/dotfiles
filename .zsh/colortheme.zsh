colortheme() {
  local theme="${1:?usage: $0 <theme>}"

  # Per-app theme names (defaults to the input if not mapped)
  local wez_theme="$theme"
  local nvim_theme="$theme"
  local zsh_theme="$theme"

  case "$theme" in
    catppuccin-frappe)
      wez_theme="Catppuccin Frappe"
      zsh_theme="catppuccin-frappe"
      nvim_theme="catppuccin-frappe"
      ;;
    catppuccin-latte)
      wez_theme="Catppuccin Latte"
      zsh_theme="catppuccin-latte"
      nvim_theme="catppuccin-latte"
      ;;
    catppuccin-macchiato)
      wez_theme="Catppuccin Macchiato"
      zsh_theme="catppuccin-macchiato"
      nvim_theme="catppuccin-macchiato"
      ;;
    catppuccin-mocha)
      wez_theme="Catppuccin Mocha"
      zsh_theme="catppuccin-mocha"
      nvim_theme="catppuccin-mocha"
      ;;
    rose-pine)
      wez_theme="rose-pine"
      zsh_theme="rose-pine"
      nvim_theme="rose-pine"
      ;;
    rose-pine-dawn)
      wez_theme="rose-pine-dawn"
      zsh_theme="rose-pine-dawn"
      nvim_theme="rose-pine-dawn"
      ;;
    rose-pine-moon)
      wez_theme="rose-pine-moon"
      zsh_theme="rose-pine-moon"
      nvim_theme="rose-pine-moon"
      ;;
    tokyonight)
      wez_theme="Tokyo Night"
      zsh_theme="tokyonight-night"
      nvim_theme="tokyonight-night"
      ;;
    tokyonight-day)
      wez_theme="Tokyo Night Day"
      zsh_theme="tokyonight-day"
      nvim_theme="tokyonight-day"
      ;;
    tokyonight-storm)
      wez_theme="Tokyo Night Storm"
      zsh_theme="tokyonight-storm"
      nvim_theme="tokyonight-storm"
      ;;
    tokyonight-moon)
      wez_theme="Tokyo Night Moon"
      zsh_theme="tokyonight-moon"
      nvim_theme="tokyonight-moon"
      ;;
    dracula)
      wez_theme="Dracula (Official)"
      zsh_theme="dracula"
      nvim_theme="dracula"
      ;;
    *)
      # leave defaults
      ;;
  esac

  # Files 
  local ZSHRC="${ZSHRC:-$HOME/.zshrc}"
  local WEZTERM="${WEZTERM:-$HOME/.wezterm.lua}"
  local NVIM_COLORS="${NVIM_COLORS:-$HOME/.config/nvim/lua/plugins/colorscheme.lua}"

  sed -i '' -E "s|(zsh-syntax-highlighting-colorschemes/)[^/]+|\\1${zsh_theme}.zsh|" "$ZSHRC"
  sed -i '' -E "s|p10k-colorschemes/[^\"]+\.zsh|p10k-colorschemes/${zsh_theme}.zsh|g" "$ZSHRC"
  # source "$ZSHRC"

  sed -i '' -E "s|^([[:space:]]*config\.color_scheme[[:space:]]*=[[:space:]]*\")[^\"]+|\\1${wez_theme}|" "$WEZTERM"

  sed -i '' -E "s|^([[:space:]]*colorscheme[[:space:]]*=[[:space:]]*\")[^\"]+(\"[[:space:]]*,)|\\1${nvim_theme}\\2|" "$NVIM_COLORS"



  print "✅ Theme switched to: ${theme}"
  print "   - ${ZSHRC}"
  print "   - ${WEZTERM}"
  print "   - ${NVIM_COLORS}"
}

# Completion
_colortheme() {
  emulate -L zsh
  setopt extendedglob

  local def line key
  local -a candidates

  def="$(functions colortheme 2>/dev/null)" || return 1
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
compdef _colortheme colortheme
