#!bin/bash -e

WORKING_DIR=$(pwd)

echo '--------Checking machine OS--------'
# Check the operating system
if [[ "$(uname)" == "Linux" ]]; then
    # Action for Linux
    echo "Running on Linux"

elif [[ "$(uname)" == "Darwin" ]]; then
    # Action for macOS
    echo "Running on macOS"

    # Setup .zshrc
    cd $WORKING_DIR
    echo '--------Setting up ZSH configuration-------'
    rm -rf ~/.zshrc
    cd $WORKING_DIR/zsh_configuration
    . ./mac.sh
    echo ZSH configured
    cd $WORKING_DIR
fi

# Setup vim
echo '--------Setting up Vim configuration--------'
cd $WORKING_DIR
rm -rf ~/.vimrc
cp ./vim_configuration/.vimrc ~/.vimrc
echo Vim configured

# Setup neovim
echo '--------Setting up NeoVim configuration--------'
cd $WORKING_DIR/neovim_configuration/convenience
. ./install.sh
cd $WORKING_DIR