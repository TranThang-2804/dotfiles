{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tommy";
  home.homeDirectory = "/home/tommy";

  home.packages = [
    pkgs.neofetch
    pkgs.go
    pkgs.ripgrep
    pkgs.fzf
    pkgs.nodejs_20
    pkgs.neovim

    pkgs.sway
    pkgs.swaylock
    pkgs.waybar
    pkgs.kitty
  ];

  programs.neovim.package = pkgs.neovim.overrideAttrs (_: rec {
    version = "0.10.0";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = version;
      sha256 = "nixpkgs/1a9df4f74273f90d04e621e8516777efcec2802a#neovim";
    };
  });

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
