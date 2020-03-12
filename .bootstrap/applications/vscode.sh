brew_cask_ensure_latest visual-studio-code
ln -f -s \
  $(pwd)/../.linked/vscode/settings.json \
  ~/"Library/Application Support/Code/User/settings.json"
