{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.git
    pkgs.awscli
    pkgs.curl
    pkgs.tmux
    pkgs.zsh
    pkgs.wl-clipboard
    pkgs.xclip
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

    pkgs.sway
    pkgs.swaylock
    pkgs.waybar
    pkgs.wlogout
    pkgs.pamixer
    pkgs.blueman
    pkgs.gtk3
    pkgs.brightnessctl
    pkgs.libinput-gestures
    pkgs.networkmanager_dmenu
    pkgs.kitty

    pkgs.teams-for-linux
    pkgs.slack
  ];

}
