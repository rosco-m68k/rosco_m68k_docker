FROM bitnami/minideb
RUN apt-get update &&                                           \
    apt-get install -y --allow-unauthenticated                  \
    zsh curl git sudo build-essential
RUN useradd -m -s /bin/zsh linuxbrew &&                         \
    usermod -aG sudo linuxbrew &&                               \
    mkdir -p /home/linuxbrew/.linuxbrew &&                      \
    chown -R linuxbrew /home/linuxbrew/.linuxbrew &&            \
    echo "linuxbrew ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
ENV PATH="${PATH}:/home/linuxbrew/.linuxbrew/bin"
RUN brew tap rosco-m68k/toolchain
RUN brew install gcc-cross-m68k@13 vasm-all srecord
ENTRYPOINT /bin/zsh

