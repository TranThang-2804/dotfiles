# Project Setup
As an enthusiast on NeoVim, developer environment configuration, I created a framework that can easilly be used to setup a new machine with all the necessary tools and configurations. This project is based on NixOS and Home-Manager, which are the best tools for declarative system configuration and package management.

This framework will make sure you will have the expected environment, tools, dotfiles configurations on any machines, OS, or architecture. (Except Windows, I'm sorry for that. :D - Be a man and use Arch Linux instead!)

This project requires executing a setup script to configure the local machine environment. Please follow the instructions below based on your operating system.

## Project structure
```
.
├── dotfiles                    - Contains all the dotfiles for the local machine
│   ├── .config                 - Nvim configuration is maintained in this dir
│   ├── .alias
│   ├── .p10k.zsh
│   ├── .tmux.conf
│   ├── .vimrc
│   └── .zshrc
├── hosts                       - NixOS configurations for the local machine
│   └── nixos
├── common.nix                  - Common home-manager configuration for all machines
├── home.amd64.nix              - Home-manager configuration for amd64 architecture
├── home.arm64.nix              - Home-manager configuration for arm64 architecture
├── flake.lock                  - flake.lock file, remove if needed
├── flake.nix                   - flake configuration file
├── .gitignore
├── Dockerfile                  - Dev container that has all the tools installed
├── LICENSE
└── README.md
```

## Prerequisites
- nixpkg
- home-manager
- flake

NOTE: You will need to enable flake with this command:
```
mkdir ~/.config/nix/
touch ~/.config/nix/nix.conf
echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf
```

### For wsl
For neovim to work properly with the wsl clipboard you should install:
win32yank using powershell:
```
choco install win32yank
```

## Installation
1. For amd64 architecture, run the following command:
```
home-manager switch --impure --flake .#amd64
```

2. For arm64 architecture, run the following command:
```
home-manager switch --impure --flake .#arm64
```

3. For wsl architecture, run the following command:
```
home-manager switch --impure --flake .#wsl
```

4. For darwin architecture, run the following command:
```
home-manager switch --impure --flake .#darwin
```
