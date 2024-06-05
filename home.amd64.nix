{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wl-clipboard
    pkgs.xclip
    pkgs.python3

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

    pkgs.teams-for-linux
    pkgs.slack
  ];

}