# Overview

This repo provide a framework structure for storing all of your working environment configuration using declarative way. This code skeleton uses devbox for configuring the environment. Please read below instruction
for how to use it.

This project requires executing a setup script to configure the local machine environment. Please follow the instructions below based on your operating system.

# Project structure
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

# Prerequisites
- devbox

To install them, you can follow this guide:
1. install devbox (Linux/MacOS/WSL2)
```
curl -fsSL https://get.jetify.com/devbox | bash
```

## Neovim dotfiles
[Neovim Configuration](./dotfiles/.config/nvim/README.md)

## For wsl
For neovim to work properly with the wsl clipboard you should install:
win32yank using powershell:
```
choco install win32yank
```

# Installation
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
