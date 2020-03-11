#!/usr/bin/env zsh
set -e

if [[ "$(stat -f %A /usr/local/share/zsh)" != "755" ]]; then
  sudo chmod -R 755 /usr/local/share/zsh
fi
if [[ "$(stat -f %A /usr/local/share/zsh/site-functions)" != "755" ]]; then
  sudo chmod -R 755 /usr/local/share/zsh/site-functions
fi

if [[ ! -d ~/.zinit/bin/.git ]]; then
  mkdir -p ~/.zinit
  git clone https://github.com/zdharma/zinit ~/.zinit/bin
fi

zsh -c "source ~/.zinit/bin/zinit.zsh; zinit self-update"
