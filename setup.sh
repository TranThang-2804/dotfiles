#!/bin/bash

WORKING_DIR=$(pwd)

INSTALL_PACKAGE=$1

# Check the operating system
echo '--------Checking machine OS--------'
if [[ "$(uname)" == "Darwin" && $INSTALL_PACKAGE == "all" ]]; then
	# Action for macOS
	echo "Running on macOS"
	cd "$WORKING_DIR/package"
	. ./macos.sh
	cd "$WORKING_DIR"
elif [[ "$(uname)" == "Linux" && $INSTALL_PACKAGE == "all" ]]; then
	# Action for Linux
	echo "Running on Linux"
	cd "$WORKING_DIR/package"
	. ./linux.sh
	cd "$WORKING_DIR"
elif [[ $INSTALL_PACKAGE == "docker" ]]; then
	# Action for Linux
	echo "Running on Linux"
	cd "$WORKING_DIR/package"
	. ./docker.sh
	cd "$WORKING_DIR"
fi

# Setup .zshrc
echo '--------Setting up ZSH configuration-------'
rm -rf ~/.zshrc
cd "$WORKING_DIR/zsh"
. ./setup.sh
echo ZSH configured
cd "$WORKING_DIR"

# Setup LazyVim
echo '--------Setting up NeoVim configuration--------'
if [[ -d ~/.config/nvim ]]; then
	rm -rf ~/.config/nvim/*
else
	mkdir -p ~/.config/nvim
fi

cp -a neovim/. ~/.config/nvim
echo NeoVim configured

# Setup tmux
echo '--------Setting up Tmux configuration--------'
rm -rf ~/.tmux.conf

cp tmux/.tmux.conf ~/.tmux.conf
echo NeoVim configured

