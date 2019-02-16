FROM centos:7.6.1810

LABEL name="Firebird 1.5.6" \
    vendor="CentOS" \
    license="GPLv2" \
	maintainer="helion@mendanha.com.br" \
    build-date="20190216" 

ADD files/FirebirdSS-1.5.6.5026-0.i686.rpm /root

RUN yum -y install epel-release \
	&& yum -y upgrade \
	&& yum -y update \
	&& cd /root \
	&& yum -y install FirebirdSS-1.5.6.5026-0.i686.rpm \
	&& cat /etc/firebird/firebird.conf | sed s/'#RemoteAuxPort = 0'/'RemoteAuxPort = 3051'/g > /etc/firebird/firebird.conf \
	&& cat /etc/firebird/firebird.conf | sed s/'#RemoteServicePort = 3050'/'RemoteServicePort = 3050'/g > /etc/firebird/firebird.conf \
	&& ln -sf /dev/stdout /var/log/firebird/firebird2.5.log \
	&& rm -rf FirebirdSS-1.5.6.5026-0.i686.rpm

WORKDIR /root

EXPOSE 3050 3051

CMD ["/usr/sbin/fbguard"]