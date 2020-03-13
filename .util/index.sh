local __dirname="${0:A:h}"
local __caller="${ZSH_ARGZERO}"

# Ensure a standard environment
set -e

# Load our standard helpers
source "${__dirname}"/brew.sh
source "${__dirname}"/env.sh
