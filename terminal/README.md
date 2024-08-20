# Setup

## SSH and keychain

- generate a new SSH key
- `sudo apt install keychain`
- add to the top of `~/.zshrc`: `eval `keychain --agents ssh --eval ~/.ssh/yourSSHKey``

## Nice terminal utilities

- `atuin` - [fancy shell history](https://atuin.sh/)
- `bat` - [`cat` clone with syntax highlights](https://github.com/sharkdp/bat)
- `exa` - [nicer `ls`](https://the.exa.website/)
- `fd` - a [nicer `find`](https://github.com/sharkdp/fd)
- `fzf` - [a fast and pleasant fuzzy-finder](https://github.com/junegunn/fzf)
- `jq` - the Swiss Army Knife of CLI data manipulation
- `ripgrep` - [fancy `grep` that respects `.gitignore`](https://github.com/BurntSushi/ripgrep)

## Terminal Maximization

ensure that the terminal opens maximized!

- in Windows, this can be done right in the terminal settings GUI.
- in Gnome, this can be done by [configuring the desktop shortcut](https://askubuntu.com/a/408202) to pass the `--maximize` flag.
