# Baseline Configuration
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

# https://github.com/zsh-users/zsh-history-substring-search
zinit ice wait lucid
zinit load zsh-users/zsh-history-substring-search

export HISTORY_SUBSTRING_SEARCH_FUZZY=yes

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
