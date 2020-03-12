#!/usr/bin/env zsh
set -e
source ./util/brew.sh

for script in $(ls ./applications/*.sh); do
  source "${script}"
done
