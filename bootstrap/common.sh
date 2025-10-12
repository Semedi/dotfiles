#!/usr/bin/env bash

# Ensure sudo access
if ! sudo -v; then
  echo "This script requires sudo privileges"
  exit 1
fi

# Create config directories if missing
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.local/bin"
