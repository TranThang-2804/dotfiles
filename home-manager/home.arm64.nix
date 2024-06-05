{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.git
    pkgs.awscli
    pkgs.curl
    pkgs.tmux
    pkgs.zsh
    pkgs.python3
    pkgs.docker
    pkgs.neofetch
    pkgs.lazygit

    pkgs.go
    pkgs.ripgrep
    pkgs.fzf
    pkgs.nodejs_20
    pkgs.neovim
    pkgs.jq
    pkgs.yarn

    pkgs.kitty
  ];

}
