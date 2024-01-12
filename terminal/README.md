# Setup

## zsh

```
apt install zsh
chsh -s $(which zsh)
```

## [oh-my-zsh](https://ohmyz.sh/)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## powerlevel10k

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

then:

- set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.
- restart Zsh with `exec zsh`.
- choose:
  - rainbow prompt
  - Unicode
  - 24 hour format
  - angled separators
  - sharp head
  - flat tail
  - two line
  - disconnected
  - full frame
  - darkest frame
  - sparse
  - many icons
  - fluent
  - transient prompt
  - instant prompt

## SSH and keychain

- generate a new SSH key
- `sudo apt install keychain`
- add to the top of `~/.zshrc`: `eval `keychain --agents ssh --eval ~/.ssh/yourSSHKey``

## Windows Terminal

ensure that the terminal opens maximized!