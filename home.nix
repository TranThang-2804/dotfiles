{ config, pkgs, ... }:

{
  home.username = "tranthang";
  home.homeDirectory = "/Users/tranthang";

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

  home.file = {
    ".config/home-manager" = {
        source = src/.config/home-manager;
        recursive = true;
    };

    ".config/hypr" = {
        source = src/.config/hypr;
        recursive = true;
    };

    ".config/kitty" = {
        source = src/.config/kitty;
        recursive = true;
    };

    ".config/libinput-gestures" = {
        source = src/.config/libinput-gestures;
        recursive = true;
    };

    ".config/nix" = {
        source = src/.config/nix;
        recursive = true;
    };

    ".config/nixpkgs" = {
        source = src/.config/nixpkgs;
        recursive = true;
    };

    ".config/nvim" = {
        source = src/.config/nvim;
        recursive = true;
    };

    ".config/sway" = {
        source = src/.config/sway;
        recursive = true;
    };

    ".config/swaylock" = {
        source = src/.config/swaylock;
        recursive = true;
    };

    ".config/waybar" = {
        source = src/.config/waybar;
        recursive = true;
    };

    ".config/wezterm" = {
        source = src/.config/wezterm;
        recursive = true;
    };

    ".zshrc".source = src/.zshrc;
    ".vimrc".source = src/.vimrc;
    ".tmux.conf".source = src/.tmux.conf;
    ".p10k.zsh".source = src/.p10k.zsh;
    ".alias".source = src/.alias;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
