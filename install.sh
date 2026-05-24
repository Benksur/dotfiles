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

  mkdir -p "$HOME/bin"
  ln -sf "$DOTFILES/macos/aerospace/aerospace-switch" "$HOME/bin/aerospace-switch"
  chmod +x "$DOTFILES/macos/aerospace/aerospace-switch"
  "$DOTFILES/macos/aerospace/aerospace-switch" standard
  ln -sfn "$DOTFILES/macos/ubersicht/widgets/simple-bar" "$UBERSICHT_WIDGETS/simple-bar"
  ln -sfn "$DOTFILES/macos/ubersicht/.simplebarrc" "$HOME/.simplebarrc"
  ln -sfn "$DOTFILES/macos/ghostty" "$HOME/.config/ghostty"
  ln -sfn "$DOTFILES/macos/karabiner" "$HOME/.config/karabiner"

  WALLPAPER="$(find "$DOTFILES/backgrounds" -maxdepth 1 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.heic' -o -iname '*.webp' \) \
    | LC_ALL=C sort | head -1)"
  if [ -n "$WALLPAPER" ]; then
    echo "==> Setting desktop wallpaper..."
    osascript -e "tell application \"System Events\" to tell every desktop to set picture to POSIX file \"$WALLPAPER\"" \
      2>/dev/null || true
  fi

  # AeroSpace: Ctrl+Cmd+drag anywhere on a window to reposition (see AeroSpace goodies).
  defaults write -g NSWindowShouldDragOnGesture -bool true

  if command -v aerospace &>/dev/null; then
    aerospace reload-config 2>/dev/null || true
  fi
fi

echo "==> Install complete"
