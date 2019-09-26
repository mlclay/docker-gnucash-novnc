FROM ubuntu:disco

ENV DEBIAN_FRONTEND noninteractive

#Setup Language
RUN apt-get update && apt-get install -y locales && locale-gen en_US

#Install packages
WORKDIR /opt
RUN apt-get update -y && \
	apt-get install -y git x11vnc xvfb openbox net-tools python-numpy menu &&  \
	git clone https://github.com/kanaka/noVNC.git noVNC && \
	git clone https://github.com/kanaka/websockify noVNC/utils/websockify && \
	apt-get remove -y git && \
	apt-get autoremove -y && \
	apt-get autoclean -y && \
	rm -rf /var/lib/apt/lists/*

#Install GnuCash
RUN apt-get update -y && \
	apt-get install -y gnucash && \
	apt-get autoremove -y && \
	apt-get autoclean -y && \
	rm -rf /var/lib/apt/lists/*

#Setup Volumes
RUN  mkdir /var/gnucash
VOLUME /var/gnucash

COPY startup.sh /startup.sh

#Finalize
WORKDIR /var/gnucash
CMD /startup.sh
EXPOSE 6080
