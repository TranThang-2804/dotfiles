{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tommy";
  home.homeDirectory = "/home/tommy";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

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


  home.file = {
    ".config/hypr" = {
        source = dotfiles/.config/hypr;
        recursive = true;
    };

    ".config/kitty" = {
        source = dotfiles/.config/kitty;
        recursive = true;
    };

    ".config/libinput-gestures" = {
        source = dotfiles/.config/libinput-gestures;
        recursive = true;
    };

    ".config/nix" = {
        source = dotfiles/.config/nix;
        recursive = true;
    };

    ".config/nixpkgs" = {
        source = dotfiles/.config/nixpkgs;
        recursive = true;
    };

    ".config/nvim" = {
        source = dotfiles/.config/nvim;
        recursive = true;
    };

    ".config/sway" = {
        source = dotfiles/.config/sway;
        recursive = true;
    };

    ".config/swaylock" = {
        source = dotfiles/.config/swaylock;
        recursive = true;
    };

    ".config/waybar" = {
        source = dotfiles/.config/waybar;
        recursive = true;
    };

    ".config/wezterm" = {
        source = dotfiles/.config/wezterm;
        recursive = true;
    };

    ".zshrc".source = dotfiles/.zshrc;
    ".vimrc".source = dotfiles/.vimrc;
    ".tmux.conf".source = dotfiles/.tmux.conf;
    ".p10k.zsh".source = dotfiles/.p10k.zsh;
    ".alias".source = dotfiles/.alias;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
