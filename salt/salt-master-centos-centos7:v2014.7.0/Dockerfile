FROM centos:centos7
MAINTAINER slafs

RUN rpm -Uvh http://ftp.pbone.net/pub/fedora/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
RUN yum install -y salt-master && yum clean all

# just in case
RUN mkdir -p /etc/salt/master.d

ADD master.conf /etc/salt/master.d/master.conf

CMD ["salt-master", "-l", "debug"]
