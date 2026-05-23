# amuse layout — stone grey base + muted accents (Nerd Font for \uE0A0)
# Matches ghostty palette: grey text, soft red/green/blue for status
autoload -U colors && colors

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[109]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[168]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[180]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[168]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

PROMPT='
%{$fg_bold[252]%}%~%{$reset_color%}$(git_prompt_info)$(virtualenv_prompt_info) %{$fg[246]%}⌚ %{$fg[252]%}%*%{$reset_color%}
%{$fg[243]%}$ %{$reset_color%}'

RPROMPT='$(ruby_prompt_info)'

VIRTUAL_ENV_DISABLE_PROMPT=0
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" %{$fg[108]%}🐍 "
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
