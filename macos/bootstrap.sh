#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/.dotfiles/"

echo "==> macOS bootstrap starting..."

if ! xcode-select -p &>/dev/null; then
  xcode-select --install
  exit 0
fi

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"

brew bundle --file="$DOTFILES/macos/Brewfile"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

chsh -s "$(which zsh)" || true

mkdir -p "$HOME/.config" "$HOME/bin"

echo "==> macOS bootstrap done"
