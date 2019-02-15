FROM centos:7.6.1810

MAINTAINER helion@mendanha.com.br

LABEL name="Firebird 2.5.8" \
    vendor="CentOS" \
    license="GPLv2" \
    build-date="20190215"
	
RUN yum -y install epel-release \
	&& yum -y upgrade \
	&& yum -y update \
	&& yum -y install firebird-superserver-2.5.8.27089.0-1.el7.x86_64 \
	&& cat /etc/firebird/firebird.conf | sed s/'#RemoteAuxPort = 0'/'RemoteAuxPort = 3051'/g > /etc/firebird/firebird.conf \
	&& cat /etc/firebird/firebird.conf | sed s/'#RemoteServicePort = 3050'/'RemoteServicePort = 3050'/g > /etc/firebird/firebird.conf

RUN ln -sf /dev/stdout /var/log/firebird/firebird2.5.log

EXPOSE 3050 3051

CMD ["/usr/sbin/fbguard"]