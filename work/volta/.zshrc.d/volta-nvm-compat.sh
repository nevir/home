# https://crtxdmp.com/load-nvmrc-file-with-volta-on-directory-change.html

volta_nvm_echo() {
  command printf %s\\n "$*" 2>/dev/null
}

volta_nvm_find_up() {
  local path_
  path_="${PWD}"
  while [ "${path_}" != "" ] && [ ! -f "${path_}/${1-}" ]; do
    path_=${path_%/*}
  done
  volta_nvm_echo "${path_}"
}

volta_nvm_find_nvmrc() {
  local dir
  dir="$(volta_nvm_find_up '.nvmrc')"
  if [ -e "${dir}/.nvmrc" ]; then
    volta_nvm_echo "${dir}/.nvmrc"
  fi
}

volta_nvm_find_package_json() {
  local dir
  dir="$(volta_nvm_find_up 'package.json')"
  if [ -e "${dir}/package.json" ]; then
    volta_nvm_echo "${dir}/package.json"
  fi
}

#this loads always the latest installed version, if you want a different default change this line
export VOLTA_DEFAULT_NODE_VERSION="$(volta list node --format=plain | tail -1 | cut -d' ' -f2)"

load-volta() {
  local node_version="$(node -v)"
  local nvmrc_path="$(volta_nvm_find_nvmrc)"

  if [ -f "$(volta_nvm_find_package_json)" ] && jq -e '.volta | has("node")' "$(volta_nvm_find_package_json)" > /dev/null; then
     echo "Found pinned node version in package.json, skipping .nvmrc"
  else
    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version="$(cat "${nvmrc_path}")"

      if [ "$nvmrc_node_version" = "N/A" ]; then
        volta install $VOLTA_DEFAULT_NODE_VERSION
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        volta install "node@$(cat "${nvmrc_path}")"
      fi
    elif [ "$node_version" != "$(echo $VOLTA_DEFAULT_NODE_VERSION | cut -d'@' -f2)" ]; then
      echo "Reverting to volta default version"
      volta install $VOLTA_DEFAULT_NODE_VERSION
    fi
  fi
}

add-zsh-hook chpwd load-volta
load-volta
