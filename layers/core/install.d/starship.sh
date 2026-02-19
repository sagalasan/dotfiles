#!/bin/bash
set -euo pipefail

# Load cargo environment if it exists
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Idempotent starship installation via cargo
if ! command -v starship &> /dev/null; then
    if ! command -v cargo &> /dev/null; then
        echo "Error: cargo not found. Please install rustup first."
        exit 1
    fi
    cargo install starship --locked
else
    echo "starship is already installed, skipping."
fi
