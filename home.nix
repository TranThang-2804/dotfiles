{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.

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

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tranthang/etc/profile.d/hm-session-vars.sh
  #

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
