{ config, pkgs, ... }:

{  
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "thangtd18ngt";
  home.homeDirectory = "/home/thangtd18ngt";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.11";
}
