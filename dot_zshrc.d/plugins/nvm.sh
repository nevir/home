# https://github.com/lukechilds/zsh-nvm
zinit ice wait'0.25' lucid atload'ensure-node'
zinit load lukechilds/zsh-nvm

export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true

ensure-node() {
  local version="$(nvm version default 2>&1)"
  if [[ ! "$version" =~ ^v[0-9.]+$ ]]; then
    nvm install "$(cat $NVM_DIR/alias/default)"
  fi
}
