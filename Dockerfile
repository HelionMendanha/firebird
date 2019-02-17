FROM helionmendanha/centos-epel:7.6.1810

LABEL name="Firebird CS 1.5.6" \
    vendor="CentOS" \
    license="GPLv2" \
    maintainer="helion@mendanha.com.br" \
    build-date="20190217" 

ADD files/FirebirdSS-1.5.6.5026-0.i686.rpm /root
ADD files/UDF.zip /root

RUN yum -y install epel-release \
	&& yum -y upgrade \
	&& yum -y update \
	&& cd /root \
	&& yum -y install glibc.i686 compat-libstdc++-33.i686 ncurses-devel.i686 ncurses-devel \
	&& yum -y install FirebirdSS-1.5.6.5026-0.i686.rpm \
	&& cat /opt/firebird/firebird.conf | sed s/'#RemoteAuxPort = 0'/'RemoteAuxPort = 3051'/g > /opt/firebird/firebird.conf \
	&& cat /opt/firebird/firebird.conf | sed s/'#RemoteServicePort = 3050'/'RemoteServicePort = 3050'/g > /opt/firebird/firebird.conf \
	&& unzip /root/UDF.zip -d /opt/firebird \
	&& rm -rf /root/FirebirdSS-1.5.6.5026-0.i686.rpm /root/UDF.zip

WORKDIR /root

EXPOSE 3050 3051

CMD ["/opt/firebird/bin/fbguard"]
