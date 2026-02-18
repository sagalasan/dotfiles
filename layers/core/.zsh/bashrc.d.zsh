# Load all the files from ~/.bashrc.d/ that have a #zsh-compatible annotation

if [ -d ~/.bashrc.d ]; then
  for f in ~/.bashrc.d/*.sh; do
    if grep '#zsh-compatible' $f >& /dev/null; then
      source $f
    fi
  done
fi
