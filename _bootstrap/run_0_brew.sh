#!/usr/bin/env bash
# 
# Ensures that homebrew is installed and up to date.
# https://brew.sh/

if ! type brew >/dev/null; then
  echo "Installing Homebrew…"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating Homebrew…"
brew update
