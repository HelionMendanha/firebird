FROM helionmendanha/centos-epel:7.6.1810

LABEL name="Firebird 2.5.8" \
    vendor="CentOS" \
    license="GPLv2" \
    maintainer="helion@mendanha.com.br" \
    build-date="20190217"
	
RUN yum -y install epel-release \
	&& yum -y upgrade \
	&& yum -y update \
	&& yum -y install firebird-superclassic-2.5.8.27089.0-1.el7.x86_64 \
	&& ln -sf /dev/stdout /var/log/firebird/firebird2.5.log

WORKDIR /root

EXPOSE 3050 3051

CMD ["/usr/sbin/fbguard"]
