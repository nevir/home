brew_ensure_latest() {
  local formula="${1}"
  local args=("${@}")
  
  if ! brew_is_installed "${formula}"; then
    brew install "${args[@]}"
  elif ! brew_is_latest "${formula}"; then
    brew upgrade "${args[@]}"
  fi
}

brew_is_installed() {
  local formula="${1}"

  for brew in $(brew list); do
    if [[ "${brew}" == "${formula}" ]]; then return 0; fi
  done

  return 1
}

brew_is_latest() {
  local formula="${1}"

  for brew in $(brew outdated --quiet); do
    if [[ "${brew}" == "${formula}" ]]; then return 1; fi
  done

  return 0
}
