#!/usr/bin/env bash
set -euo pipefail

case "$(uname)" in
  Darwin)
    bash ~/.dotfiles/macos/bootstrap.sh
    ;;
  Linux)
    bash ~/.dotfiles/arch/bootstrap.sh
    ;;
esac
