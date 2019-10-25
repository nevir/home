<<chezmoi_bootstrap >/dev/null
  brew_ensure_latest gnupg
chezmoi_bootstrap

# https://github.com/sorin-ionescu/prezto/tree/master/modules/gpg
zplugin ice wait silent
zplugin snippet PZT::modules/gpg/init.zsh
