FROM		ubuntu:16.04
MAINTAINER	shlee.mars@gmail.com

#build with docker build --build-arg --build-arg PETALINUX_INSTALLER=petalinux-v2017.4-final-installer.run -t petalinux

ARG PETALINUX_INSTALLER

# add sourcelist
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list && \
    cat /etc/apt/sources.list && \
    dpkg --add-architecture i386
    
# package update
RUN apt-get -y update && \
    apt-get -y install build-essential sudo expect emacs && \
    apt-get -y install gcc gawk diffstat xvfb chrpath socat xterm autoconf libtool libtool-bin python git net-tools zlib1g-dev libncurses5-dev libssl-dev xz-utils locales wget tftpd cpio gcc-multilib tofrodos iproute gnupg flex bison 

# locale update
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# adduser vivado
RUN adduser --disabled-password --gecos '' vivado && \
    usermod -aG sudo vivado && \
    echo "vivado ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


USER vivado
ENV HOME /home/vivado
ENV LANG en_US.UTF-8

COPY accept-eula.sh ${PETALINUX_INSTALLER} /

RUN sudo mkdir -p /opt/pkg/petalinux && \
    sudo chmod 777 /tmp /opt/pkg/petalinux && \
    sudo chown vivado /tmp /opt/pkg/petalinux && \
    cd /tmp && \
    /accept-eula.sh /${PETALINUX_INSTALLER} /opt/pkg/petalinux && \
    sudo rm -f /${PETALINUX_INSTALLER} /accept-eula.sh

ENV mkdir /home/vivado
WORKDIR /home/vivado

ADD https://github.com/Digilent/Petalinux-Zybo-Z7-10/releases/download/v2017.4-1/Petalinux-Zybo-Z7-10-2017.4-1.bsp

RUN echo "source /opt/pkg/petalinux/settings.sh" >> /home/vivado/.bashrc
