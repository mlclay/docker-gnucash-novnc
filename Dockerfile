FROM ubuntu:zesty

ENV DEBIAN_FRONTEND noninteractive

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh

#Install packages
RUN apt-get update -y
RUN apt-get install -y git x11vnc xvfb openbox net-tools python-numpy menu
RUN apt-get install -y gnucash

#Clone additional repositories
RUN cd /root && git clone https://github.com/kanaka/noVNC.git
RUN cd /root/noVNC/utils && git clone https://github.com/kanaka/websockify websockify

#Cleanup after install
RUN apt-get remove -y git
RUN apt-get autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

CMD /startup.sh
EXPOSE 6080
