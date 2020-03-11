brew_ensure_latest() {
  local formula="${1}"
  local args=("${@}")
  
  if ! brew_is_installed "${formula}"; then
    brew install "${args[@]}"
  elif ! brew_is_latest "${formula}"; then
    brew upgrade "${args[@]}"
  fi
}

brew_cask_ensure_latest() {
  local formula="${1}"
  local args=("${@}")
  
  if ! brew_is_installed "${formula}" cask; then
    brew cask install "${args[@]}"
  elif ! brew_is_latest "${formula}" cask; then
    brew cask upgrade "${args[@]}"
  fi
}

brew_is_installed() {
  local formula="${1}"
  local cask="${2}"

  for brew in $(brew ${cask} list); do
    if [[ "${brew}" == "${formula}" ]]; then return 0; fi
  done

  return 1
}

brew_is_latest() {
  local formula="${1}"
  local cask="${2}"

  for brew in $(brew ${cask} outdated --quiet); do
    if [[ "${brew}" == "${formula}" ]]; then return 1; fi
  done

  return 0
}
