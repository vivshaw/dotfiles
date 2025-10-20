# system-independent zsh config
# ------------------------------

# initialize Atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# configure aliases
alias cat=bat
alias ls=eza

# configure editors
export VISUAL="nvim"
export EDITOR="$VISUAL"

# activate `fnm`: https://github.com/Schniz/fnm
if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd)"
fi

# activate `direnv`: https://direnv.net/
if command -v direnv >/dev/null; then
    eval "$(direnv hook zsh)"
fi
