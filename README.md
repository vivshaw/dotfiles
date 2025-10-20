# What is this?

this repo contains settings, assets, dotfiles, and docs for getting a new computing environment set up the way I'd prefer it.

## Prerequisites

setup will require Git, Python, Pip, Pipx, and Ansible.

```sh
# or Brew, etc.
sudo apt install python3 python3-pip pipx git
pipx install ansible-core
pipx ensurepath
```

## Setup

### Automated

```sh
ansible-galaxy collection install community.genera
ansible-playbook main.yml --ask-become-pass
```

### Manual

- install a terminal
- install [the fonts](./assets/fonts/), set them in the terminal app
- install [the themes](./themes/)
- set [the background](./assets/images/)

## TODO

- automate Gnome setup, as much as possible
- figure out how to automate Gnome Terminal shortcut edit to be fullscreen
- figure out how to fix transparency weirdness on login screen
- figure out macOS AltTab, can that be automated?
- can pipx path be configured across all systems?
- can I make ssh key names generic?