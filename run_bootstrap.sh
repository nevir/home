#!/usr/bin/env bash

# Ensure that all scripts run relative to the _bootstrap dir.
cd ~/.local/share/chezmoi/_bootstrap

echo
echo -e "\033[2mbootstrapping…\033[0m"

for script in $(ls ./*.sh); do
  [[ "${script}" =~ _(.+)\.sh$ ]] && name="${BASH_REMATCH[1]}"
  echo -en "… ${name}\r"

  output="$("${script}" 2>&1)"
  status=$?

  if (( status == 0 )); then
    echo -e "\033[32m✓\033[0m ${name}"
  else
    echo
    echo -e "\033[31m✗\033[0m ${name}"
    echo "${output}"
    echo -e "\033[31m✗\033[0m ${name}"
    echo
  fi
done

echo -e "\033[2m…bootstrapping complete\033[0m"
echo
