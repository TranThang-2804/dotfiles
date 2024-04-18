#!/bin/bash -e

# Install apt packages
sudo apt update
sudo apt install curl git gcc -y
sudo apt install tmux -y
sudo apt install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir ~/Documents/Note

# Install Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit
rm -rf lazygit.tar.gz

# Install nerd-fonts
curl -Lo JetBrainsMono.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
unzip JetBrainsMono.zip -d ~/.fonts
fc-cache -fv
rm -rf JetBrainsMono.zip

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Neovim
sudo snap install nvim --classic

# TODO: Install go

# Install ripgrep
sudo apt-get install ripgrep

sudo apt install xclip

# Set zsh default
sudo chsh -s $(which zsh)
