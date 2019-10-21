# https://github.com/zsh-users/zsh-history-substring-search
zplugin ice wait lucid
zplugin load zsh-users/zsh-history-substring-search

HISTORY_SUBSTRING_SEARCH_FUZZY='yes'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
