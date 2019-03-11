FROM		ubuntu:16.04
MAINTAINER	shlee.mars@gmail.com

# package update
RUN 		apt-get -y update && \
 		apt-get -y install gcc gawk diffstat xvfb chrpath socat xterm autoconf libtool libtool-bin python git net-tools zlib1g-dev libncurses5-dev libssl-dev xz-utils locales

# locale update
RUN 		locale-gen en_US.UTF-8 && \
		update-locale LANG=en_US.UTF-8
