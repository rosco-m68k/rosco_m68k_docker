FROM ubuntu:24.10
RUN apt-get update &&                                           \
    apt-get install -y --allow-unauthenticated                  \
    xxd zsh curl git sudo build-essential
RUN useradd -m -s /bin/zsh linuxbrew &&                         \
    usermod -aG sudo linuxbrew &&                               \
    mkdir -p /home/linuxbrew/.linuxbrew &&                      \
    chown -R linuxbrew /home/linuxbrew/.linuxbrew &&            \
    echo "linuxbrew ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
ENV PATH="${PATH}:/home/linuxbrew/.linuxbrew/bin"
RUN brew install python
RUN brew tap rosco-m68k/toolchain
RUN brew install gcc-cross-m68k@13 vasm-all srecord
RUN brew unlink binutils-cross-m68k
RUN brew unlink gcc-cross-m68k@13
RUN brew unlink vasm-all
RUN brew install rosco-m68k-toolchain@13
RUN brew link --overwrite binutils-cross-m68k
RUN brew link --overwrite gcc-cross-m68k@13
ENTRYPOINT /bin/zsh

