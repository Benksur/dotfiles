# amuse layout — Stone high-contrast (matches shared/nvim/lua/themes/stone.lua)
# Nerd Font for \uE0A0
autoload -U colors && colors

# Palette: fg=#hex (zsh 5.8+ truecolor; Ghostty supports it)
_stone_reset='%{%f%b%k%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{%F{#82aee8}%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="${_stone_reset}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{#e090a0}%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{#ddd4a8}%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{%F{#b0acd8}%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›${_stone_reset}"

PROMPT='
%{%F{#eceef2}%b%}%~${_stone_reset}$(git_prompt_info)$(virtualenv_prompt_info) %{%F{#a0a8b4}%}⌚ %{%F{#f8f9fb}%}%*${_stone_reset}
%{%F{#c0c6d0}%}$ ${_stone_reset}'

RPROMPT='$(ruby_prompt_info)'

VIRTUAL_ENV_DISABLE_PROMPT=0
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" %{%F{#8ebdb4}%}🐍 "
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="${_stone_reset}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
