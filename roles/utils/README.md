# Utils role

this role installs a handful of useful CLI utils that I like to have handy:

- `atuin` - [fancy shell history](https://atuin.sh/)
- `bat` - [`cat` clone with syntax highlights](https://github.com/sharkdp/bat)
- `exa` - [nicer `ls`](https://the.exa.website/)
- `fd` - a [nicer `find`](https://github.com/sharkdp/fd)
- `fzf` - [a fast and pleasant fuzzy-finder](https://github.com/junegunn/fzf)
- `jq` - the Swiss Army Knife of CLI data manipulation
- `ripgrep` - [fancy `grep` that respects `.gitignore`](https://github.com/BurntSushi/ripgrep)

## Custom Scripts

This role also installs custom scripts from the `bin/` directory to `~/.local/bin` and makes them executable. Currently includes:

- `git-recent` - Interactive tool to quickly checkout recent git branches
