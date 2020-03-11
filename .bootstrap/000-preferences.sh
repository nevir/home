#!/usr/bin/env zsh
set -e

# See
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/keith/dotfiles/blob/master/osx/defaults.sh

for script in $(ls ./.bootstrap/*.sh); do
  source ./.bootstrap/"${script}"
done
