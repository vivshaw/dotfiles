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

Then:

- Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.
- Restart Zsh with `exec zsh`.
- Choose:
  - rainbow prompt
  - Unicode
  - 24 hour format
  - flat prompt head & tails
  - two line
  - disconnected
  - full frame
  - darkest frame
  - sparse
  - fluent
  - transient prompt
  - instant prompt
