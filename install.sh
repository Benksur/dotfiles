#!/usr/bin/env bash
# Symlink tracked config into $HOME. Safe to re-run after pulling dotfiles.
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

echo "==> Linking shared dotfiles..."

ln -sf "$DOTFILES/shared/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/shared/git/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$DOTFILES/shared/nvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES/shared/btop" "$HOME/.config/btop"
ln -sfn "$DOTFILES/shared/neofetch" "$HOME/.config/neofetch"

if [ "$(uname)" = "Darwin" ]; then
  echo "==> Linking macOS dotfiles (AeroSpace, Übersicht, simple-bar)..."

  UBERSICHT_WIDGETS="$HOME/Library/Application Support/Übersicht/widgets"
  mkdir -p "$HOME/.config" "$UBERSICHT_WIDGETS"

  ln -sfn "$DOTFILES/macos/aerospace/default-config.toml" "$HOME/.aerospace.toml"
  ln -sfn "$DOTFILES/macos/ubersicht/widgets/simple-bar" "$UBERSICHT_WIDGETS/simple-bar"
  ln -sfn "$DOTFILES/macos/ubersicht/.simplebarrc" "$HOME/.simplebarrc"
  ln -sfn "$DOTFILES/macos/ghostty" "$HOME/.config/ghostty"

  if command -v aerospace &>/dev/null; then
    aerospace reload-config 2>/dev/null || true
  fi
fi

echo "==> Install complete"
