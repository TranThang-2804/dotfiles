#!bin/bash

# This script is for setting up environment for mac

# Setup vim
echo '--------Setting up Vim configuration--------'
rm -rf ~/.vimrc
cp ./vim_configuration/.vimrc ~/.vimrc
echo Vim configured

echo '---------Checking machine OS--------'
# Check the operating system
if [[ "$(uname)" == "Linux" ]]; then
    # Action for Linux
    echo "Running on Linux"

elif [[ "$(uname)" == "Darwin" ]]; then
    # Action for macOS
    echo "Running on macOS"

    # Setup .zshrc
    echo '--------Setting up ZSH configuration-------'
    rm -rf ~/.zshrc
    cp ./zsh_configuration/.zshrc ~/.zshrc
    echo ZSH configured
fi