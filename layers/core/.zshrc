# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Load plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# Load .zsh files
plug "$HOME/.zsh/*"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Initialise starship prompt
eval "$(starship init zsh)"
