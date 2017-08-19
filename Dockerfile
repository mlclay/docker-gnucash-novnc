FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh

#Install packages
RUN apt-get update -y && \
    apt-get install -y git x11vnc Xvfb openbox net-tools python-numpy menu && \
    apt-get install -y gnucash && \
    git clone https://github.com/kanaka/noVNC.git /root/noVNC/ && \
    git clone https://github.com/kanaka/websockify /root/noVNC/utils/websockify && \
    apt-get remove -y git && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

CMD /startup.sh
EXPOSE 6080
