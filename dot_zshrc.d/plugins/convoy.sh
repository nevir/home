<<chezmoi_bootstrap >/dev/null
  brew_ensure_latest aws-okta
chezmoi_bootstrap

AWS_OKTA_MFA_PROVIDER="OKTA"
AWS_OKTA_MFA_FACTOR_TYPE="push"
AWS_OKTA_DEFAULT_PROFILE="prod-ro"

# Strawman for a `convoy` command to help with ops and the like.
convoy() {
  local command="${1:-help}"
  local args="${@:2}"

  if ! type "convoy-${command}" >/dev/null; then
    echo "unknown command '${command}'"
    command="help"
  fi

  "convoy-${command}" "${args[@]}"
}

convoy-help() {
  echo "HALP" "${@}"
}

convoy-login() {
  local profile="${1:-${AWS_OKTA_DEFAULT_PROFILE}}"

  convoy-ensure-okta-configured

  mkdir -p ~/.aws
  touch ~/.aws/credentials

  # Both write credentials…
  aws-okta write-to-credentials "${profile}" ~/.aws/credentials \
    --mfa-provider "${AWS_OKTA_MFA_PROVIDER}" \
    --mfa-factor-type "${AWS_OKTA_MFA_FACTOR_TYPE}"
  
  # …and set up the environment for CLI use.
  source <(aws-okta env "${profile}" \
    --mfa-provider "${AWS_OKTA_MFA_PROVIDER}" \
    --mfa-factor-type "${AWS_OKTA_MFA_FACTOR_TYPE}")
}

convoy-console() {
  local profile="${1:-${AWS_OKTA_DEFAULT_PROFILE}}"

  convoy-ensure-okta-configured
  aws-okta login "${profile}" \
    --mfa-provider "${AWS_OKTA_MFA_PROVIDER}" \
    --mfa-factor-type "${AWS_OKTA_MFA_FACTOR_TYPE}"
}

# Make sure that Okta is set up for the current user.
convoy-ensure-okta-configured() {
  local user="${1:-${USER}}"

  # Have we previously run aws-okta add?
  if security find-generic-password -a okta-creds -s aws-okta-login >/dev/null 2>&1; then return 0; fi

  aws-okta add \
    --domain convoy.okta.com \
    --username "${USER}" \
    --mfa-provider "${AWS_OKTA_MFA_PROVIDER}" \
    --mfa-factor-type "${AWS_OKTA_MFA_FACTOR_TYPE}"
}
