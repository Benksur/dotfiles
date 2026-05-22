export ZSH="$HOME/.oh-my-zsh/"

ZSH_THEME="amuse"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"
