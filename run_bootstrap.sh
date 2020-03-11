#!/usr/bin/env bash

if [[ "${SKIP_BOOTSTRAP}" != "" ]]; then exit 0; fi

# Ensure that all scripts run relative to the .bootstrap dir.
cd ~/.local/share/chezmoi/.bootstrap

run_script() {
  name="${1}"
  command="${@:2}"

  echo -en "… ${name}\r"

  output="$(bash -c "${command[@]}" 2>&1)"
  status=$?

  if (( status == 0 )); then
    echo -e "\033[32m✓\033[0m ${name}"
  else
    echo -e "\033[31m✗\033[0m ${name} ⬇"
    echo "${output}"
    echo -e "\033[31m✗\033[0m ${name} ⬆"
  fi
}

echo
echo -e "\033[2mbootstrapping…\033[0m"

sudo echo 

for script in $(ls ./*.sh); do
  [[ "$(basename "${script}")" =~ ^[0-9]+-(.+).sh$ ]] && name="${BASH_REMATCH[1]}"
  run_script "${name}" "${script}"
done

for plugin in $(ls ~/.local/share/chezmoi/dot_zshrc.d/plugins/*.sh); do
  bootstrap=$(sed -n '/<<chezmoi_bootstrap/,/chezmoi_bootstrap/{//!p;}' "${plugin}")
  if [[ -z "${bootstrap}" ]]; then continue; fi

  run_script "zsh: $(basename ${plugin%.*})" eval "source ./util/*.sh;" "${bootstrap}"
done

echo -e "\033[2m…bootstrapping complete\033[0m"
echo
