brew_cask_ensure_latest visual-studio-code
ln -f -s \
  "${CHEZMOI_ROOT}"/.linked/vscode/settings.json \
  ~/"Library/Application Support/Code/User/settings.json"
