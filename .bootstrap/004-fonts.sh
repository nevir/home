#!/usr/bin/env zsh
set -e
source ./util/brew.sh

brew tap homebrew/cask-fonts
brew_cask_ensure_latest font-fira-mono-for-powerline
