#!/bin/bash
set -euo pipefail

# Idempotent rustup installation
if ! command -v rustup &> /dev/null; then
    echo "Installing rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
else
    echo "rustup is already installed, skipping."
fi
