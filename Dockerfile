FROM skysider/pwndocker


MAINTAINER hyc <hayicle.vn@gmail.com>
LABEL maintainer="hayicle.vn@gmail.com"
LABEL version="1.0"
LABEL description="vim IDE with pwndocker framework"


RUN apt install -y neovim python3 python3-neovim python-neovim git make && \
    dpkg --add-architecture i386 && \
    mkdir -p /root/.config/nvim/ && \
    curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ADD conf/init.vim /root/.config/nvim/init.vim

#Install Plugin config color
RUN nvim +'PlugInstall' +'q!' +'q!' && \
		echo "alias vim='nvim'" >> /root/.bashrc && \
    sed -i 's/#force_color_prompt*/force_color_prompt=yes/' /root/.bashrc

