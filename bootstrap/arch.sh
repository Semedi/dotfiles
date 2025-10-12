#!/usr/bin/env bash
set -euo pipefail
require_sudo

echo "Updating and installing on Arch..."
sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm git base-devel zsh tmux neovim kitty stow

echo "Bootstrap Arch done."
