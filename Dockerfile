FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh

#Install packages
RUN apt-get update -y && \
	apt-get install -y git x11vnc Xvfb openbox net-tools python-numpy menu &&  \
	cd /opt/ && \
		git clone https://github.com/kanaka/noVNC.git noVNC && \
		git clone https://github.com/kanaka/websockify noVNC/utils/websockify && \
	apt-get remove -y git && \
	apt-get autoremove -y && \
	apt-get autoclean -y

#Install GnuCash from Source
RUN	apt-get update -y && \
	apt-get build-dep -y gnucash && \
	apt-get purge -y guile-2.0 && \
	apt-get install -y wget slib libgnomeui-common libgnomeui-dev guile-1.8 guile-1.8-dev checkinstall && \
	apt-get install -y build-essential autoconf intltool libtool && \
	mkdir /tmp/build && cd /tmp/build && \
		wget http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-2.6.17.tar.bz2 && \
		tar xvjf gnucash-2.6.17.tar.bz2 && \
		cd gnucash-2.6.17 && \
			./configure --enable-compile-warnings --with-html-engine=webkit && \
			make && make install && checkinstall -y && ldconfig && \
			#dpkg -i gnucash_2.6.17-1_amd64.deb && \
	rm -r /tmp/build && \
	apt-get remove -y wget slib libgnomeui-common libgnomeui-dev guile-1.8-dev checkinstall && \
	apt-get remove -y build-essential autoconf intltool libtool && \
	apt-get autoremove -y && \
	apt-get autoclean -y

CMD /startup.sh
EXPOSE 6080
