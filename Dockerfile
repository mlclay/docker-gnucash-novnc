FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh

#Install packages
RUN apt-get update -y && \
    apt-get install -y git x11vnc Xvfb openbox net-tools python-numpy menu && \
    git clone https://github.com/kanaka/noVNC.git /root/noVNC/ && \
    git clone https://github.com/kanaka/websockify /root/noVNC/utils/websockify && \
    apt-get remove -y git && \
    apt-get autoremove -y && \
    apt-get autoclean -y

#Install GnuCash from Source
RUN	apt-get update -y && \
	apt-get build-dep -y gnucash && \
	apt-get purge -y guile-2.0 && \
	apt-get install -y wget slib libgnomeui-common libgnomeui-dev guile-1.8 guile-1.8-dev checkinstall && \
	wget http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-2.6.17.tar.bz2 && \
	tar xvjf gnucash-2.6.17.tar.bz2 && \
	cd gnucash-2.6.17 && ./configure --prefix=/opt/gnucash --enable-compile-warnings --with-html-engine=webkit && \
	make && checkinstall -y \
	apt-get remove -y wget slib libgnomeui-common libgnomeui-dev guile-1.8 guile-1.8-dev checkinstall && \
	apt-get autoremove -y && \
	apt-get autoclean -y

CMD /startup.sh
EXPOSE 6080
