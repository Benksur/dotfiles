#!/usr/bin/env bash
# First-time macOS setup: Homebrew packages, shell, Übersicht + simple-bar links.
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

echo "==> macOS bootstrap starting..."

if ! xcode-select -p &>/dev/null; then
  xcode-select --install
  echo "==> Re-run bootstrap after Xcode Command Line Tools finish installing."
  exit 0
fi

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"

echo "==> Installing Homebrew packages (Ghostty, Übersicht, AeroSpace, ...)..."
brew bundle --file="$DOTFILES/macos/Brewfile"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

chsh -s "$(command -v zsh)" 2>/dev/null || true

mkdir -p "$HOME/.config" "$HOME/bin"

osascript -e 'tell application "System Events" to set autohide menu bar of dock preferences to true' \
  2>/dev/null || true

echo "==> Linking dotfiles..."
bash "$DOTFILES/install.sh"

echo "==> Starting Übersicht and AeroSpace (grant Accessibility if prompted)..."
open -ga "Übersicht" 2>/dev/null || open -a "Übersicht" 2>/dev/null || true
open -ga "AeroSpace" 2>/dev/null || open -a "AeroSpace" 2>/dev/null || true

echo "==> macOS bootstrap done"
echo ""
echo "Manual steps:"
echo "  • System Settings → Privacy & Security → Accessibility: enable Übersicht and AeroSpace"
echo "  • Übersicht menu bar icon → refresh widgets if simple-bar does not appear"
echo "  • simple-bar settings: click the bar, then press Cmd+, (config: ~/.simplebarrc)"
