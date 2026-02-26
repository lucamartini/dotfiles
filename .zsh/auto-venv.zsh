if [[ -z "${_AUTO_UV_VENV_LOADED:-}" ]]; then
  _AUTO_UV_VENV_LOADED=1

  autoload -U add-zsh-hook

  _auto_uv_venv() {
    local venv_path="$PWD/.venv"

    if [[ -d "$venv_path" ]]; then
      if [[ "$VIRTUAL_ENV" != "$venv_path" ]]; then
        [[ -n "$VIRTUAL_ENV" ]] && deactivate 2>/dev/null
        source "$venv_path/bin/activate"
      fi
    else
      [[ -n "$VIRTUAL_ENV" ]] && deactivate 2>/dev/null
    fi
  }

  add-zsh-hook chpwd _auto_uv_venv
  _auto_uv_venv
fi