#!/usr/bin/env bash
# Common functions and checks

require_sudo() {
  if ! sudo -v; then
    echo "This script requires sudo privileges"
    exit 1
  fi
}

create_dirs() {
  mkdir -p "$HOME/.config"
  mkdir -p "$HOME/.local/share"
  mkdir -p "$HOME/.local/bin"
}
