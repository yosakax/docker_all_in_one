FROM nvcr.io/nvidia/tensorflow:20.12-tf2-py3
LABEL yasuhiro osaka (md20017@shibaura-it.ac.jp)

SHELL ["/bin/bash", "-c"]
Arg UNAME=ubuntu
Arg UID=1000
Arg arglist="UNAME UID"

ENV DEBIAN_FRONTEND "noninteractive"
RUN apt-get update 
RUN apt-get install -y cmake libopenmpi-dev zlib1g-dev python3-tk
RUN apt install -y emacs screen htop

RUN apt-get update && apt-get upgrade -y
RUN apt-get install sudo
## install libs for pyenv and opencv.
RUN apt-get install -y \
    curl\
    build-essential \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    liblzma-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    git\
    mesa-utils



##  Create User
RUN useradd -m --uid ${UID} -d /home/${UNAME} --groups sudo  ${UNAME}
RUN echo "${UNAME}:ubuntu" | chpasswd
RUN echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown -R ${UNAME}:${UNAME} /home/${UNAME}
RUN usermod -aG sudo $UNAME
RUN chsh -s /bin/bash ${UNAME}
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN apt-get autoclean
USER ${UNAME}
WORKDIR /home/${UNAME}
ENV HOME /home/${UNAME}

## install libraries
RUN pip install --upgrade pip
RUN pip install gym --user
###### Stable-baselines
#RUN pip install stable-baselines[mpi]
###### other library
RUN pip install seaborn tqdm pydot --user

################################################################################
##  Bash setting
RUN echo 'export PATH=/usr/local/cuda/bin:$PATH' >> /home/$UNAME/.bashrc
RUN echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> /home/$UNAME/.bashrc
RUN echo 'export CPATH=$HOME/cuda/include:$CPATH' >> /home/$UNAME/.bashrc
RUN echo 'export LIBRARY_PATH=$HOME/cuda/lib64:$LIBRARY_PATH' >> /home/$UNAME/.bashrc
RUN echo 'export LD_LIBRARY_PATH=$HOME/cuda/lib64:$LD_LIBRARY_PATH' >> /home/$UNAME/.bashrc


RUN echo 'PS1_COLOR_BEGIN="\[\e[1;31m\]"' >> /home/$UNAME/.bashrc
RUN echo 'PS1_COLOR_END="\[\e[m\]"' >> /home/$UNAME/.bashrc
RUN echo 'PS1_HOST_NAME="docker"' >> /home/$UNAME/.bashrc
RUN echo 'export PS1="${PS1_COLOR_BEGIN}\u@\${PS1_HOST_NAME} \W${PS1_COLOR_END}\\$ "' >> /home/$UNAME/.bashrc

## copy rcfiles
COPY .screenrc /home/$UNAME/
COPY .emacs /home/$UNAME/
COPY .nanorc /home/$UNAME/
