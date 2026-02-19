#zsh-compatible

# Detect which `ls` flavor is in use and alias accordingly
if ls --color > /dev/null 2>&1; then 
    # Linux / GNU `ls`
    alias ls='ls --color=auto'
else 
    # macOS / BSD `ls`
    alias ls='ls -G'
    # Define standard macOS directory colors
    export LSCOLORS="Gxfxcxdxbxegedabagacad"
fi

# ls with hidden files, human-readable sizes, and file type indicators
alias ll='ls -lahF'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
