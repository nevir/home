#!/usr/bin/env zsh
set -e

if [[ ! -d ~/.zinit/bin/.git ]]; then
  mkdir -p ~/.zinit
  git clone https://github.com/zdharma/zinit ~/.zinit/bin
fi

zsh -c "source ~/.zinit/bin/zinit.zsh; zinit self-update"
