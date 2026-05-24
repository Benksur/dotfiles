export ZSH="$HOME/.oh-my-zsh/"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.dotfiles/shared/zsh/omz-custom}"

ZSH_THEME="stone"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
# Must load after oh-my-zsh (and after other plugins)
source "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Stone: high-contrast palette (matches shared/nvim/lua/themes/stone.lua)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[command]='fg=#82aee8'
ZSH_HIGHLIGHT_STYLES[builtins]='fg=#82aee8'
ZSH_HIGHLIGHT_STYLES[function]='fg=#82aee8'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#b0acd8'
ZSH_HIGHLIGHT_STYLES[path]='fg=#eceef2,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#c0c6d0'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#e090a0'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#a0a8b4'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#a0a8b4'
ZSH_HIGHLIGHT_STYLES[unknown-option]='fg=#e090a0'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#e090a0,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#82c0d0,bold'
ZSH_HIGHLIGHT_STYLES[quoted-argument]='fg=#8ebdb4'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#787f8c'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#ddd4a8'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#eceef2'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#484848'


export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"
