{ config, pkgs, ... }:

{
  home.username = "benksur";
  home.homeDirectory = "/home/benksur";
  home.stateVersion = "26.05"; # Please read the comment before changing.

  imports = [
    ./zsh.nix
  ];

  home.packages = [
    pkgs.neovim
    pkgs.gcc
    pkgs.tree-sitter
    pkgs.ripgrep
    pkgs.fd
    pkgs.unzip
    pkgs.go
    pkgs.nodejs
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.gnumake
    pkgs.pavucontrol
    pkgs.lua-language-server
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
