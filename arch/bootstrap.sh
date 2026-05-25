#!/usr/bin/env bash
# First-time Arch setup: packages, Oh My Zsh + plugins, shared install links.
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

echo "==> Arch bootstrap starting..."

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
  curl \
  git \
  wget \
  unzip \
  zsh \
  neovim \
  tmux \
  btop \
  fastfetch

if pacman -Si ghostty &>/dev/null; then
  echo "==> Installing ghostty..."
  sudo pacman -S --needed --noconfirm ghostty
else
  echo "==> ghostty not in configured repos (enable [extra] or install from AUR)"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_OMZ_CUSTOM="$DOTFILES/shared/zsh/omz-custom/plugins"
mkdir -p "$ZSH_OMZ_CUSTOM"

clone_omz_plugin() {
  local dir="$1" url="$2"
  if [ ! -d "$dir/.git" ]; then
    echo "==> Installing zsh plugin: $(basename "$dir")..."
    git clone --depth=1 "$url" "$dir"
  fi
}

clone_omz_plugin "$ZSH_OMZ_CUSTOM/zsh-autosuggestions" \
  https://github.com/zsh-users/zsh-autosuggestions
clone_omz_plugin "$ZSH_OMZ_CUSTOM/zsh-syntax-highlighting" \
  https://github.com/zsh-users/zsh-syntax-highlighting

chsh -s "$(command -v zsh)" 2>/dev/null || true

mkdir -p "$HOME/.config" "$HOME/bin"

echo "==> Linking dotfiles..."
bash "$DOTFILES/install.sh"

echo "==> Arch bootstrap complete"
