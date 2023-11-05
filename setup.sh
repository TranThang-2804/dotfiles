#!/bin/bash

WORKING_DIR=$(pwd)

INSTALL_PACKAGE=$1

# Check the operating system
echo '--------Checking machine OS--------'
if [[ "$(uname)" == "Darwin" && $INSTALL_PACKAGE == "all" ]]; then
	# Action for macOS
	echo "Running on macOS"
	cd "$WORKING_DIR/package_management"
	. ./macos.sh
	cd "$WORKING_DIR"
elif [[ "$(uname)" == "Linux" && $INSTALL_PACKAGE == "all" ]]; then
	# Action for Linux
	echo "Running on Linux"
	cd "$WORKING_DIR/package_management"
	. ./linux.sh
	cd "$WORKING_DIR"
elif [[ $INSTALL_PACKAGE == "docker" ]]; then
	# Action for Linux
	echo "Running on Linux"
	cd "$WORKING_DIR/package_management"
	. ./docker.sh
	cd "$WORKING_DIR"
fi

# Setup .zshrc
echo '--------Setting up ZSH configuration-------'
rm -rf ~/.zshrc
cd "$WORKING_DIR/zsh_configuration"
. ./setup.sh
echo ZSH configured
cd "$WORKING_DIR"

# Setup vim
echo '--------Setting up Vim configuration--------'
cd "$WORKING_DIR"
rm -rf ~/.vimrc
cp ./vim_configuration/.vimrc ~/.vimrc
echo Vim configured

#
# Setup LazyVim
echo '--------Setting up NeoVim configuration--------'
if [[ -d ~/.config/nvim ]]; then
	rm -rf ~/.config/nvim/*
else
	mkdir -p ~/.config/nvim
fi

cp -a neovim_configuration/. ~/.config/nvim
echo NeoVim configured