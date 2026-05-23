#!/usr/bin/env bash
set -euo pipefail

echo "==> Arch bootstrap starting..."

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
  curl \
  wget \
  unzip \
  zsh \
  neovim \
  tmux \
  btop \
  neofetch

if [[ "$SHELL" != "$(which zsh)" ]]; then
  echo "Changing default shell to zsh..."
  chsh -s "$(which zsh)"
fi

mkdir -p "$HOME/.config"
mkdir -p "$HOME/bin"

echo "==> Arch bootstrap complete"
