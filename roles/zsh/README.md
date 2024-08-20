# Manual Setup

## SSH and keychain on WSL

- generate a new SSH key
- `sudo apt install keychain`
- add to the top of `~/.zshrc`: `eval `keychain --agents ssh --eval ~/.ssh/yourSSHKey``

## Terminal Maximization

ensure that the terminal opens maximized!

- in Windows, this can be done right in the terminal settings GUI.
- in Gnome, this can be done by [configuring the desktop shortcut](https://askubuntu.com/a/408202) to pass the `--maximize` flag.

## Use MesloLGS font

this can be configured in the terminal font settings.
