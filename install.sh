#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/.dotfiles"

echo "==> Linking dotfiles..."

ln -sf "$DOTFILES/shared/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/shared/git/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$DOTFILES/shared/nvim" "$HOME/.config/nvim"

echo "==> Install complete"

