FROM ubuntu:latest

COPY . /initialize/installed-package

RUN apt update && apt-get update

# Install apt library
RUN apt install curl git gcc tmux xclip zsh docker.io python3 pip -y

# Install apt-get library
RUN apt-get install ripgrep -y

# Install Docker
RUN usermod -aG docker ubuntu && newgrp docker

# Setup ZSH
RUN touch /home/ubuntu/.zshrc && \
  chown ubuntu:ubuntu /home/ubuntu/.zshrc && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
  git clone https://github.com/zsh-users/zsh-autosuggestions /home/ubuntu/.zsh/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting /home/ubuntu/.zsh/zsh-syntax-highlighting && \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install go 
RUN curl -Lo go1.22.2.linux-amd64.tar.gz "https://go.dev/dl/go1.22.2.linux-amd64.tar.gz" && \
  rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz && \
  rm -rf go1.22.2.linux-amd64.tar.gz

# Install nvim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
  rm -rf /opt/nvim && \
  tar -C /opt -xzf nvim-linux64.tar.gz

ENV PATH="$PATH:/opt/nvim-linux64/bin"

# Install lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
  tar xf lazygit.tar.gz lazygit && \
  install lazygit /usr/local/bin

WORKDIR /initialize/installed-package
RUN ./setup.sh

WORKDIR /home/ubuntu

ENTRYPOINT [ "/bin/bash" ] 
