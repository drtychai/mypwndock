FROM grazfather/pwndock:latest

# GEF
RUN cd ~/tools \
    && git clone --depth 1 https://github.com/hugsy/gef.git \
    && echo "source ~/tools/gef/gef.py" > ~/.gdbinit

# Install Oh-My-ZSH
RUN apt install zsh -y
RUN curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh - | sh

# Install dotfiles
RUN cd ~/tools \
    && git clone --depth 1 https://github.com/drtychai/dotfiles.git \
    && bash ~/tools/dotfiles/init.sh

RUN echo 'export PS1="[\[\e[34m\]\u\[\e[0m\]@\[\e[33m\]\H\[\e[0m\]:\w]\n\\$ "' >> /root/.bashrc

# Work env
WORKDIR /root/ctf

