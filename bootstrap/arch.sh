#!/usr/bin/env bash
set -euo pipefail

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing base packages..."
sudo pacman -S --needed --noconfirm git base-devel zsh tmux neovim kitty stow

echo "Cloning paru AUR helper if not present..."
if ! command -v paru &>/dev/null; then
  git clone https://aur.archlinux.org/paru.git /tmp/paru
  pushd /tmp/paru
  makepkg -si --noconfirm
  popd
fi

echo "Linking dotfiles with stow..."
cd "$HOME/dotfiles"

stow nvim
stow tmux
stow zsh
stow kitty

echo "Arch bootstrap complete."
