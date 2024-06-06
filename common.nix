{ config, pkgs, ... }:

{  
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home.packages = [
    # Environment tools
    pkgs.git
    pkgs.curl
    pkgs.tmux
    pkgs.unzip
    pkgs.zsh
    pkgs.zsh-powerlevel10k
    pkgs.zsh-autocomplete
    pkgs.zsh-autosuggestions
    pkgs.python3
    pkgs.docker
    pkgs.neofetch
    pkgs.lazygit
    pkgs.ripgrep
    pkgs.fzf
    pkgs.neovim
    pkgs.jq
    pkgs.tree
    pkgs.kitty
    pkgs.thefuck

    # Devops toolchains
    pkgs.awscli
    pkgs.terraform
    pkgs.terragrunt
    pkgs.kubectl
    pkgs.helm

    # Dev Tools
    pkgs.go
    pkgs.nodejs_20
    pkgs.yarn
    pkgs.gcc
  ];

  programs = {
    zsh = {
      enable = true;

      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;

      initExtra = ''
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        bindkey -v
        export LC_ALL="en_US.UTF-8"
        export dry="--dry-run=client -o yaml";
        eval $(thefuck --alias)
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,underline"
      '';
      
      shellAliases = {
        #Alias
        tera="terraform";

        WS="/Users/tranthang/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/";
        PWS="/Users/tranthang/Library/Mobile\ Documents/com~apple~CloudDocs/Documents/Work/Devops/Projects";
        note="/Users/tranthang/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/tommy-note-vault";

        # K8s aliases
        k="kubectl";
        ka="kubectl apply -f";
        kd="kubectl delete";
        ke="kubectl edit";
        kc="kubectl create";
        kr="kubectl run";
        krp="kubectl replace";
        krpf="kubectl replace --force -f";
        kds="kubectl describe";
        kg="kubectl get";
        ksetns="kubectl config set-context --current --namespace";

        # Tmux alias
        ta="tmux attach-session -t";
        tn="tmux new-session -t";
        tk="tmux kill-session -t";
        tka="tmux kill-session -a";
        tl="tmux ls";

        # Git alias
        gs="git status";
        ga="git add";
        gc="git commit -m";
        gp="git push";

        jh="./mvnw spring-boot:run";


        # Command alias
        ls="ls -la --color";
      };

      plugins = [
        {
          src = pkgs.zsh-powerlevel10k;
          name = "powerlevel10k";
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      oh-my-zsh = {
        enable = true;
        theme = "powerlevel10k";
        plugins = [];
      };
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

    #".zshrc".source = dotfiles/.zshrc;
    ".vimrc".source = dotfiles/.vimrc;
    ".tmux.conf".source = dotfiles/.tmux.conf;
    ".p10k.zsh".source = dotfiles/.p10k.zsh;
    #".alias".source = dotfiles/.alias;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "24.11";
}
