# WSL zsh config
# ------------------------------

# set up keychain with SSH keys
# this will make your life easier when using git from WSL
eval `keychain --agents ssh --eval ~/.ssh/ockham_github_key`

# allow quick jump from WSL fs to Win fs
alias winhome="cd /mnt/c/Users/hvivi"

# set up chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-3.3.0
