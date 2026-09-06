# Atuin zsh config
# (must run after the base keybinds to avoid conflicts)
# ------------------------------

if [[ -r "$HOME/.atuin/bin/env" ]]; then
  . "$HOME/.atuin/bin/env"
fi

if command -v atuin >/dev/null; then
  eval "$(atuin init zsh)"
fi
