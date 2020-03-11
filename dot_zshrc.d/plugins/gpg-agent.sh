<<chezmoi_bootstrap >/dev/null
  brew_ensure_latest gnupg
chezmoi_bootstrap

# https://github.com/sorin-ionescu/prezto/tree/master/modules/gpg
zinit ice wait silent
zinit snippet PZT::modules/gpg/init.zsh
