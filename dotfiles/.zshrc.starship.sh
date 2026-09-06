# Starship prompt
# ------------------------------

if command -v starship >/dev/null; then
  eval "$(starship init zsh)"
fi

source "$HOME/.zshrc.atuin.sh"

# syntax highlighting must be loaded after all widgets and key bindings.
[[ -r "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
