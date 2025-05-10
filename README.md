# Overview

This repo provide a framework structure for storing all of your working environment configuration using declarative way. This code skeleton uses devbox for configuring the environment. Please read below instruction
for how to use it.

This project requires executing a setup script to configure the local machine environment. Please follow the instructions below based on your operating system.

# Project structure
```
.
├── LICENSE
├── README.md
├── Taskfile.yml
├── config
│   ├── hypr
│   ├── libinput-gestures
│   ├── nvim                    # nvim configuration
│   ├── sway
│   ├── swaylock
│   ├── waybar
│   └── wezterm                 # Wezterm configuration file
└── devbox.json                 # Maintain all your binaries in declarative
```

# Prerequisites
- devbox

To install them, you can follow this guide:
1. install taskfile
[Link to install taskfile](https://taskfile.dev/installation/)

## Neovim dotfiles
[Neovim Configuration](./dotfiles/.config/nvim/README.md)

## For wsl
For neovim to work properly with the wsl clipboard you should install:
win32yank using powershell:
```
choco install win32yank
```

# Installation
```
task setup
```

>NOTE: when running task setup, it will install devbox, and install
all required binaries (git, zsh, ...)
