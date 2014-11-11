FROM centos:centos6
MAINTAINER slafs

RUN rpm -Uvh http://ftp.icm.edu.pl/pub/Linux/fedora/linux/epel/6/i386/epel-release-6-8.noarch.rpm
RUN yum install -y salt-minion && yum clean all

# just in case
RUN mkdir -p /etc/salt/minion.d

ADD minion.conf /etc/salt/minion.d/minion.conf

CMD ["salt-minion", "-l", "debug"]
