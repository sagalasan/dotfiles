#!/bin/bash
set -euo pipefail

# Idempotent zsh installation
if ! command -v zsh &> /dev/null; then
    sudo apt-get install -y zsh
else
    echo "zsh is already installed, skipping."
fi
