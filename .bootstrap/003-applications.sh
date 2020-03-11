#!/usr/bin/env zsh
set -e
source ./util/brew.sh

brew_cask_ensure_latest google-chrome
brew_cask_ensure_latest iterm2
brew_cask_ensure_latest slack
brew_cask_ensure_latest visual-studio-code
