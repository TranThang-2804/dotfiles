FROM ubuntu:22.04

ENV TERM=xterm-256color

RUN apt update && apt-get update

# Install required apt library
RUN apt install curl git tmux xclip zsh docker.io -y
RUN apt-get install ninja-build gettext cmake unzip build-essential -y

# Install Docker
RUN usermod -aG docker root && newgrp docker

# Setup ZSH
RUN touch /root/.zshrc && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
  git clone https://github.com/zsh-users/zsh-autosuggestions /root/.zsh/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting /root/.zsh/zsh-syntax-highlighting && \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
  chsh -s $(which zsh)

# Install lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
  tar xf lazygit.tar.gz lazygit && \
  install lazygit /usr/local/bin

# Install nvim
RUN git clone https://github.com/neovim/neovim --branch v0.9.5 --depth=1 && \
  cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && make install && cd .. && rm -rf neovim

# Install go 
RUN curl -Lo go1.22.2.linux-amd64.tar.gz "https://go.dev/dl/go1.22.2.linux-amd64.tar.gz" && \
  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz && \
  rm -rf go1.22.2.linux-amd64.tar.gz

ENV PATH="$PATH:/opt/nvim-linux64/bin"

# Install custom apt library
RUN apt install gcc python3 pip fzf npm make -y

# Install apt-get library
RUN apt-get install ripgrep locales -y

# Set locales
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

COPY . /initialize/installed-package
WORKDIR /initialize/installed-package
RUN ./setup.sh

WORKDIR /root

ENTRYPOINT [ "/bin/zsh" ]
