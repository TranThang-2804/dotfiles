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

# Setup dotfiles
sudo cp -arf ./src/. ~
echo '--------Set up dotfiles configuration finished-------'
