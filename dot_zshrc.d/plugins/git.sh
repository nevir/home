<<chezmoi_bootstrap >/dev/null
  brew_ensure_latest hub
chezmoi_bootstrap

# https://github.com/knu/zsh-git-escape-magic
zinit snippet https://raw.githubusercontent.com/knu/zsh-git-escape-magic/master/git-escape-magic

# https://github.com/github/hub
alias git=hub
