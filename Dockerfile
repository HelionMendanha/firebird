FROM helionmendanha/centos-epel:7.6.1810

LABEL name="Firebird CS 1.5.6" \
    vendor="CentOS" \
    license="GPLv2" \
    maintainer="helion@mendanha.com.br" \
    build-date="20190220" 

ADD files/FirebirdSS-1.5.6.5026-0.i686.rpm /root
ADD files/UDF.tar.gz /root

RUN yum -y install epel-release \
	&& yum -y upgrade \
	&& yum -y update \
	&& cd /root \
	&& yum -y install glibc.i686 compat-libstdc++-33.i686 ncurses-devel.i686 ncurses-devel \
	&& yum -y install FirebirdSS-1.5.6.5026-0.i686.rpm \
	&& mv /root/UDF/* /opt/firebird/UDF \
	&& rm -rf /root/FirebirdSS-1.5.6.5026-0.i686.rpm /root/UDF

WORKDIR /root

EXPOSE 3050 3051

CMD ["/opt/firebird/bin/fbguard"]
