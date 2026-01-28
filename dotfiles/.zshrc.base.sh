# system-independent zsh config
# ------------------------------

# configure aliases
alias cat=bat
alias ls=eza

# git stuff

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

## list recent branches, by date of latest change
alias grecent='git branch --sort=-committerdate | head -n 20'

ggrep() {
  git grep --break --heading --line-number $@;
}

## set upstream branch to current branchname on origin
gupstr() {
  git branch --set-upstream-to=origin/$(git rev-parse --abbrev-ref HEAD)
}

## push current branch to origin with upstream tracking
gpush() {
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  git push -u origin "$current_branch"
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

# configure editors
export VISUAL="nvim"
export EDITOR="$VISUAL"

# activate `fnm`: https://github.com/Schniz/fnm
if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd --corepack-enabled)"
fi

# activate `direnv`: https://direnv.net/
if command -v direnv >/dev/null; then
    eval "$(direnv hook zsh)"
fi
