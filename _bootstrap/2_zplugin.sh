#!/usr/bin/env bash
set -e

if [[ ! -d ~/.zplugin/bin/.git ]]; then
  mkdir -p ~/.zplugin
  git clone https://github.com/zdharma/zplugin ~/.zplugin/bin
fi

zsh -c "source ~/.zplugin/bin/zplugin.zsh; zplugin self-update"
