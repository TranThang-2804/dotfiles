{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wl-clipboard
    pkgs.xclip
    pkgs.fcitx5
    pkgs.fcitx5-unikey
    pkgs.fcitx5-rime
    pkgs.fcitx5-gtk
    pkgs.libsForQt5.fcitx5-qt

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
