#!/usr/bin/env zsh
set -e

# See
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/keith/dotfiles/blob/master/osx/defaults.sh

for script in $(ls ./preferences/*.sh); do
  zsh "${script}"
done
