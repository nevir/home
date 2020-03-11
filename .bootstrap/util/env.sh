is_command() {
  command="${1}"

  type "${1}" >/dev/null
}
