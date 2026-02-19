# History configuration
HISTFILE="$HOME/.zsh_history"

# How many commands to keep in memory and on disk
HISTSIZE=50000
SAVEHIST=50000

# History options
setopt EXTENDED_HISTORY          # Write the timestamp and duration of each command
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY             # Share history across all open terminal sessions
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded event if new event is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a duplicate previously found in search
setopt HIST_IGNORE_SPACE         # Do not record commands that start with a space (great for secrets)
setopt HIST_REDUCE_BLANKS        # Remove extra whitespace from commands before saving

# Bind Up/Down arrows to the substring search plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down
