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

# Stone palette for syntax highlighting (load after plugin)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[command]='fg=110'
ZSH_HIGHLIGHT_STYLES[builtins]='fg=110'
ZSH_HIGHLIGHT_STYLES[function]='fg=110'
ZSH_HIGHLIGHT_STYLES[alias]='fg=109'
ZSH_HIGHLIGHT_STYLES[path]='fg=252,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=246'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=168'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=245'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=245'
ZSH_HIGHLIGHT_STYLES[unknown-option]='fg=168'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=168,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=109,bold'
ZSH_HIGHLIGHT_STYLES[quoted-argument]='fg=252'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

export PATH="$HOME/bin:$PATH"
export EDITOR="nvim"
