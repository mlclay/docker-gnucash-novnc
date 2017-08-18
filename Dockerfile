FROM ubuntu
RUN apt-get update && apt-get upgrade && apt-get dist-upgrade
RUN apt-get install gnucash -y
RUN apt-get install novnc -y
