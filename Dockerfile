FROM ubuntu:22.04

ENV NODE_MAJOR=20

RUN apt-get update && \
  apt-get install -y software-properties-common ca-certificates curl gnupg && \
  add-apt-repository ppa:neovim-ppa/unstable -y && \
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  chmod a+r /etc/apt/keyrings/docker.gpg && \
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
  apt-get update && \
  apt-get install -y wget git gcc make g++ fd-find ripgrep neovim python3 python3-pip python3-venv unzip nodejs docker-ce-cli docker-buildx-plugin docker-compose-plugin && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean && \
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') && \
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
  tar xf lazygit.tar.gz lazygit && \
  install lazygit /usr/local/bin

# RUN addgroup --gid 1000 docker && \
#   adduser --uid 1000 --gid 1000 --disabled-password docker && \
#   echo 'nonroot ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# USER docker

RUN mkdir -p ~/.local/bin && \
  ln -s "$(which fdfind)" ~/.local/bin/fd
ENV PATH="${PATH}:~/.local/bin"

WORKDIR /root/.config/nvim
