#!/usr/bin/env zsh
set -e
source ./util/env.sh

if ! is_command brew; then
  echo "Installing Homebrew…"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating Homebrew…"
brew update
