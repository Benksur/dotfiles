#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/.dotfiles"

echo "==> Linking dotfiles..."

ln -sf "$DOTFILES/shared/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/shared/git/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$DOTFILES/shared/nvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES/shared/btop" "$HOME/.config/btop"
ln -sfn "$DOTFILES/shared/neofetch" "$HOME/.config/neofetch"


echo "==> Install complete"

