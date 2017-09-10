#!/bin/bash

set -e

origFolder="$HOME/.orig-dotfiles"

stowDirs=( bash git )

for stow in ${stowDirs[@]}; do
    echo "Validating $stow..."
    cd $stow
    files=( $(find . -type f | sed 's/^.\///g') )
    for name in ${files[@]}; do
        file="$HOME/$name"
        if [ -e "$file" ]; then
            if ! [[ -h "$file" ]]; then
                echo "$file exists but is not a symlink"
                echo "Moving..."
                mkdir -p "$origFolder/$stow"
                mv $file "$origFolder/$stow/"
            fi
        fi
    done
    cd ..
done

echo ""
echo "Stowing..."

for stow in ${stowDirs[@]}; do
    echo "stow $stow"
    stow $stow
done


