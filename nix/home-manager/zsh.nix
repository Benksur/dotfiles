{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "git"
      ];
    };

    shellAliases = {
      ll = "ls -lah";
    };

    initContent = ''
      export EDITOR="nvim"
      export PATH="$HOME/bin:$PATH"

      autoload -U colors && colors


      ZSH_THEME_GIT_PROMPT_PREFIX=" on %F{#e58a3a}\uE0A0%f "
      ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
      ZSH_THEME_GIT_PROMPT_DIRTY="%F{#f0a05a}!%f"
      ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{#707070}?%f"
      ZSH_THEME_GIT_PROMPT_CLEAN=""


      PROMPT='
      %F{#e58a3a}%n%f %F{#777777}%~%f$(git_prompt_info)$(virtualenv_prompt_info)
      $ '


      typeset -A ZSH_HIGHLIGHT_STYLES

      ZSH_HIGHLIGHT_STYLES[default]='fg=#d0d0d0'

      ZSH_HIGHLIGHT_STYLES[command]='fg=#e58a3a'
      ZSH_HIGHLIGHT_STYLES[builtins]='fg=#e58a3a'
      ZSH_HIGHLIGHT_STYLES[function]='fg=#e58a3a'
      ZSH_HIGHLIGHT_STYLES[alias]='fg=#f0a05a'

      ZSH_HIGHLIGHT_STYLES[path]='fg=#f2f2f2,underline'
      ZSH_HIGHLIGHT_STYLES[globbing]='fg=#a0a0a0'

      ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#888888'
      ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#888888'
      ZSH_HIGHLIGHT_STYLES[unknown-option]='fg=#c46128'

      ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#f0a05a,bold'
      ZSH_HIGHLIGHT_STYLES[precommand]='fg=#e58a3a,bold'

      ZSH_HIGHLIGHT_STYLES[quoted-argument]='fg=#b8b8b8'
      ZSH_HIGHLIGHT_STYLES[arg0]='fg=#f2f2f2'

      ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#f0a05a'
      ZSH_HIGHLIGHT_STYLES[redirection]='fg=#a0a0a0'
      ZSH_HIGHLIGHT_STYLES[comment]='fg=#606060'

      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#505050'
    '';
  };
}

