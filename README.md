# What is this?

this repo contains settings, assets, dotfiles, and docs for getting a new computing environment set up the way I'd prefer it.

## Prerequisites

setup will require Git, Python, Pip, Pipx, and Ansible.

```sh
sudo apt install python3 python3-pip pipx git
pipx install ansible
```

## TODO

- automate Gnome setup, as much as possible
- figure out how to automate Gnome Terminal shortcut edit
- figure out how to make `fdfind` and `batcat` aliases conditional on being Debian-based
- figure out how to fix transparency weirdness on login screen
- figure out macOS AltTab, can that be automated?
- unbreak Brew installs
- figure out what to do with local zsh customizations, without breaking the whole flow
- is Gnome config conditional? make it so if not
