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
For running this, you only need to have Taskfile (Similar with makefile). The rest will be automatically installed
with Devbox.
- Taskfile

To install Prerequisites, you can follow this guide:
1. install Taskfile
[Link to install taskfile](https://taskfile.dev/installation/)

# Neovim dotfiles
For detailed of my vim configuration:
[Neovim Configuration](./config/nvim/README.md)

# Installation
>IMPORTANT: when running task setup, it will overwrite all of your environment
configuration files. Please run it with care/backup your configuration first

All you need to run is this command:
```
task setup
```

>NOTE: when running task setup, it will install devbox, and install
all required binaries (git, zsh, ...)

# For Wsl specificly
For neovim to work properly with the wsl clipboard you should install:
win32yank using powershell:
```
choco install win32yank
```
