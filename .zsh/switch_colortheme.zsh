switch_colortheme() {
  local theme="${1:?usage: $0 <theme>}"

  # Per-app theme names (defaults to the input if not mapped)
  local wez_theme="$theme"
  local nvim_theme="$theme"
  local zsh_syntax_theme="$theme"

  case "$theme" in
    catppuccin-frappe)
      wez_theme="Catppuccin Frappe"
      zsh_syntax_theme="catppuccin-frappe"
      nvim_theme="catppuccin-frappe"
      ;;
    catppuccin-latte)
      wez_theme="Catppuccin Latte"
      zsh_syntax_theme="catppuccin-latte"
      nvim_theme="catppuccin-latte"
      ;;
    catppuccin-macchiato)
      wez_theme="Catppuccin Macchiato"
      zsh_syntax_theme="catppuccin-macchiato"
      nvim_theme="catppuccin-macchiato"
      ;;
    catppuccin-mocha)
      wez_theme="Catppuccin Mocha"
      zsh_syntax_theme="catppuccin-mocha"
      nvim_theme="catppuccin-mocha"
      ;;
    rose-pine)
      wez_theme="rose-pine"
      zsh_syntax_theme="rose-pine"
      nvim_theme="rose-pine"
      ;;
    rose-pine-dawn)
      wez_theme="rose-pine-dawn"
      zsh_syntax_theme="rose-pine-dawn"
      nvim_theme="rose-pine-dawn"
      ;;
    rose-pine-moon)
      wez_theme="rose-pine-moon"
      zsh_syntax_theme="rose-pine-moon"
      nvim_theme="rose-pine-moon"
      ;;
    tokyonight)
      wez_theme="Tokyo Night"
      zsh_syntax_theme="tokyonight-night"
      nvim_theme="tokyonight-night"
      ;;
    tokyonight-day)
      wez_theme="Tokyo Night Day"
      zsh_syntax_theme="tokyonight-day"
      nvim_theme="tokyonight-day"
      ;;
    tokyonight-storm)
      wez_theme="Tokyo Night Storm"
      zsh_syntax_theme="tokyonight-storm"
      nvim_theme="tokyonight-storm"
      ;;
    tokyonight-moon)
      wez_theme="Tokyo Night Moon"
      zsh_syntax_theme="tokyonight-moon"
      nvim_theme="tokyonight-moon"
      ;;
    dracula)
      wez_theme="Dracula (Official)"
      zsh_syntax_theme="dracula"
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

  # Pick a sed that supports -i (macOS vs GNU)
  sed_inplace() {
    local file="$1"; shift
    if sed --version >/dev/null 2>&1; then
      # GNU sed
      sed -i "$@" "$file"
    else
      # BSD/macOS sed
      sed -i '' "$@" "$file"
    fi
  }

  sed_inplace "$ZSHRC" \
    -E "s|(zsh-syntax-highlighting-colorschemes/)[^/]+|\\1${zsh_syntax_theme}.zsh|"

  sed_inplace "$WEZTERM" \
    -E "s|^([[:space:]]*config\.color_scheme[[:space:]]*=[[:space:]]*\")[^\"]+|\\1${wez_theme}|" 

  sed_inplace "$NVIM_COLORS" \
    -E "s|^([[:space:]]*colorscheme[[:space:]]*=[[:space:]]*\")[^\"]+(\"[[:space:]]*,)|\\1${nvim_theme}\\2|"

  print "✅ Theme switched to: ${theme}"
  print "   - ${ZSHRC}"
  print "   - ${WEZTERM}"
  print "   - ${NVIM_COLORS}"
}

# Completion
_switch_colortheme() {
  emulate -L zsh
  setopt extendedglob

  local def line key
  local -a candidates

  def="$(functions switch_colortheme 2>/dev/null)" || return 1
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
compdef _switch_colortheme switch_colortheme
