# macOS zsh config
# ------------------------------

# setup SSH keys
for key in ~/.ssh/id_*; do
  [[ -f "$key" && "$key" != *.pub ]] && ssh-add --apple-use-keychain "$key" 2>/dev/null
done
