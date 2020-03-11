<<chezmoi_bootstrap >/dev/null
  brew tap homebrew/command-not-found
chezmoi_bootstrap

# https://github.com/sorin-ionescu/prezto/tree/master/modules/command-not-found
zinit ice wait lucid
zinit snippet PZT::modules/command-not-found/init.zsh
