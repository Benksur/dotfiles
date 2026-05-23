#!/usr/bin/env bash
# Entry point: OS-specific bootstrap, then shared install links.
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

case "$(uname)" in
  Darwin)
    bash "$DOTFILES/macos/bootstrap.sh"
    ;;
  Linux)
    bash "$DOTFILES/arch/bootstrap.sh"
    bash "$DOTFILES/install.sh"
    ;;
esac
