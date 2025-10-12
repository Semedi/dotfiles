#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/common.sh"

echo "Launching bootstrap..."

if [[ -f /etc/arch-release ]]; then
  echo "Detected Arch-based Linux"
  source "$(dirname "$0")/arch.sh"
elif [[ -f /etc/debian_version ]]; then
  echo "Detected Debian-based Linux"
  source "$(dirname "$0")/debian.sh"
else
  echo "Unsupported distribution. Please setup manually."
  exit 1
fi

echo "Bootstrap done!"
