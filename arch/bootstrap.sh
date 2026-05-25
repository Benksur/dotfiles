#!/usr/bin/env bash
set -euo pipefail

echo "==> Arch bootstrap starting..."

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
  curl \
  wget \
  unzip \
  zsh \
  neovim \
  tmux \
  btop \
  fastfetch 

# ----------------------------
# 3. Install Oh My Zsh
# ----------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ----------------------------
# 4. Set zsh as default shell
# ----------------------------
if [[ "$SHELL" != "$(command -v zsh)" ]]; then
  echo "Changing default shell to zsh..."
  chsh -s "$(command -v zsh)" || true
fi

# ----------------------------
# 5. Oh My Zsh plugins (custom setup)
# ----------------------------
ZSH_OMZ_CUSTOM="$HOME/.config/omz-custom/plugins"
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

# ----------------------------
# 6. Config directories
# ----------------------------
mkdir -p "$HOME/.config"
mkdir -p "$HOME/bin"

# ----------------------------
# 7. Link dotfiles
# ----------------------------
if [ -f "$DOTFILES/install.sh" ]; then
  echo "==> Linking dotfiles..."
  bash "$DOTFILES/install.sh"
fi

# ----------------------------
# 8. Ensure .zshrc is linked
# ----------------------------
if [ -f "$DOTFILES/shared/zsh/.zshrc" ]; then
  ln -sf "$DOTFILES/shared/zsh/.zshrc" "$HOME/.zshrc"
fi


echo "==> Arch bootstrap complete"
