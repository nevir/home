#!/usr/bin/env zsh
if [[ "${SKIP_BOOTSTRAP}" != "" ]]; then exit 0; fi

# Ensure that all scripts run relative to the .bootstrap dir.
cd ~/.local/share/chezmoi/.bootstrap

run_script() {
  local name="${1}"
  local command=("${@:2}")

  echo -en "… ${name}\r"
  "${command[@]}"
  local exitStatus=$?

  if (( exitStatus == 0 )); then
    echo -e "\033[32m✓\033[0m ${name}"
  else
    echo -e "\033[31m✗\033[0m ${name}"
  fi
}

echo
echo -e "\033[2mbootstrapping…\033[0m"

sudo echo 

for script in $(ls ./*.sh); do
  local name="${script:6:-3}"
  run_script "${name}" zsh "${script}"
done

for plugin in $(ls ~/.local/share/chezmoi/dot_zshrc.d/plugins/*.sh); do
  local bootstrap=$(sed -n '/<<chezmoi_bootstrap/,/chezmoi_bootstrap/{//!p;}' "${plugin}")
  if [[ -z "${bootstrap}" ]]; then continue; fi

  run_script "zsh: $(basename ${plugin%.*})" eval "source ./util/*.sh;" "${bootstrap}"
done

echo -e "\033[2m…bootstrapping complete\033[0m"
echo
