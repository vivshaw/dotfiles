# What is this?

this repo contains settings, assets, dotfiles, and docs for getting a new computing environment set up the way I'd prefer it.

## Automated setup

most system configuration is automated via [the included Ansible playbook](./main.yml) and [roles](./roles/). run `setup.sh` to automagically provision Ansible and execute the playbook.

```sh
./setup.sh
```

### Manual

not all steps are fully automated. some things to be done by hand:

- install a nicer-than-default terminal
- install [the terminal fonts](./assets/fonts/), set them in the terminal app
- install [the application themes](./themes/)
- set [the desktop background](./assets/images/)
- MacOS
  - install [AltTab](https://alt-tab-macos.netlify.app/)

## TODO

- automate Gnome setup, as much as possible
- figure out how to automate Gnome Terminal shortcut edit to be fullscreen
- figure out how to fix transparency weirdness on login screen
- figure out macOS AltTab, can that be automated?
- can I make ssh key names generic?
- add uv
