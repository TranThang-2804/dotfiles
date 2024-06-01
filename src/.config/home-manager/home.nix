{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "thangtd18ngt";
  home.homeDirectory = "/home/thangtd18ngt";

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
    pkgs.hyprland

    pkgs.go
    pkgs.ripgrep
    pkgs.fzf
    pkgs.nodejs_20
    pkgs.neovim

    pkgs.sway
    pkgs.swaylock
    pkgs.waybar
    pkgs.brightnessctl
    pkgs.ibus-engines.bamboo
    pkgs.ibus
    pkgs.kitty
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
