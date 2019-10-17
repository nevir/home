#!/usr/bin/env bash
# 
# Ensures that zsh is installed and up to date.
set -e
source ./util/brew.sh

brew_ensure_latest zsh
