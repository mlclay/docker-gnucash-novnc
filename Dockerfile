FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

#Add Files
ADD startup.sh /startup.sh
RUN chmod +x /startup.sh

#Install Prerequisites
RUN apt-get update && apt-get upgrade && apt-get dist-upgrade
RUN apt-get install git x11vnc wget python python-numpy unzip xvfb firefox openbox geany menu -y
RUN apt-get install gnucash -y

#Get noVNC
RUN cd /root && git clone https://github.com/kanaka/noVNC.git
RUN cd /root/noVNC/utils && git clone https://github.com/kanaka/websockify websockify

#Cleanup
RUN apt-get autoclean && apt-get autoremove

#Run
CMD /startup.sh

#Ports
EXPOSE 6080
