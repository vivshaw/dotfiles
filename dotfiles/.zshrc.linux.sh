# Linux zsh config
# ------------------------------

# Debian-specific aliases (Debian/Ubuntu package names differ)
if [[ -f /etc/debian_version ]]; then
    alias fd=fd-find
    alias cat=batcat
fi
