FROM ubuntu

#Install Prerequisites
RUN apt-get update && apt-get upgrade && apt-get dist-upgrade
RUN apt-get install git x11vnc
RUN apt-get install gnucash -y

#Get noVNC
RUN cd /root && git clone https://github.com/kanaka/noVNC.git
RUN cd /root/noVNC/utils && git clone https://github.com/kanaka/websockify websockify

#Cleanup
RUN apt-get autoclean && apt-get autoremove
