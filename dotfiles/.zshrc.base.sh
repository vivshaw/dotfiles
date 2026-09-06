# system-independent zsh config
# ------------------------------

# configure aliases
alias cat=bat
alias ls=eza

# shell history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history hist_expire_dups_first hist_ignore_dups
setopt hist_ignore_space hist_verify share_history

# completion and key bindings
autoload -Uz compinit up-line-or-beginning-search down-line-or-beginning-search
compinit
zmodload -i zsh/complist
zmodload -i zsh/terminfo
setopt auto_menu complete_in_word always_to_end
setopt auto_cd auto_pushd pushd_ignore_dups pushd_minus
unsetopt menu_complete flowcontrol
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

bindkey -e
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^R' history-incremental-search-backward
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

# git stuff

## basic aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcmsg='git commit --message'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gfa='git fetch --all --tags --prune'
alias gfo='git fetch origin'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpsup='git push --set-upstream origin $(git branch --show-current)'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grh='git reset'
alias grs='git restore'
alias grst='git restore --staged'
alias gsta='git stash push'
alias gst='git status'
alias gss='git status --short'
alias gsb='git status --short --branch'
alias gsw='git switch'
alias gswc='git switch --create'
alias gwt='git worktree'

## configure completion for git aliases
compdef _git g=git ga=git-add gb=git-branch gco=git-checkout gc=git-commit \
  gd=git-diff gf=git-fetch gl=git-pull gp=git-push gpsup=git-push grb=git-rebase \
  grh=git-reset grs=git-restore gst=git-status gsw=git-switch gwt=git-worktree

## helper: get the default branch (master or main) for origin
_get_default_branch() {
  # try to get the default branch from origin/HEAD
  local default_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
  
  # if that fails, check which branch exists on origin
  if [ -z "$default_branch" ]; then
    if git rev-parse --verify origin/main >/dev/null 2>&1; then
      default_branch="main"
    elif git rev-parse --verify origin/master >/dev/null 2>&1; then
      default_branch="master"
    else
      echo "error: could not determine default branch (neither main nor master found)" >&2
      return 1
    fi
  fi
  
  echo "$default_branch"
}

## fuzzy-find recent branches and check out the selected one
grecent() {
  local branch
  branch=$(git branch --sort=-committerdate --format='%(refname:short)' |
    fzf --height=40% --preview='git log --oneline -10 {}') &&
    git checkout "$branch"
}

## fancy git grep
ggrep() {
  git grep --break --heading --line-number "$@"
}

## merge from default branch (master or main) into current branch
gpmer() {
  local default_branch=$(_get_default_branch) || return 1
  echo "fetching and merging origin/$default_branch into current branch..."
  git fetch origin "$default_branch" && git merge "origin/$default_branch"
}

## rebase pull from default branch (master or main)
gpreb() {
  local default_branch=$(_get_default_branch) || return 1
  echo "pulling from origin/$default_branch with rebase..."
  git pull origin "$default_branch" --rebase
}

## **interactive** rebase pull from default branch (master or main)
## (use this to unstack stacked PRs)
gunst() {
  local default_branch=$(_get_default_branch) || return 1
  echo "pulling from origin/$default_branch with interactive rebase..."
  git pull origin "$default_branch" --rebase=interactive
}

# autosuggestions
[[ -r "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
  source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# configure editors
export VISUAL="nvim"
export EDITOR="$VISUAL"

# disable Claude Code auto-memory by default
export CLAUDE_CODE_DISABLE_AUTO_MEMORY=1

# activate `fnm`: https://github.com/Schniz/fnm
if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd --corepack-enabled)"
fi

# activate `direnv`: https://direnv.net/
if command -v direnv >/dev/null; then
    eval "$(direnv hook zsh)"
fi
