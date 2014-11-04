FROM ubuntu:trusty
MAINTAINER slafs

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get install -y -q python-software-properties software-properties-common
RUN add-apt-repository -y ppa:saltstack/salt
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && apt-get install -y -q salt-master

# just in case
RUN mkdir -p /etc/salt/master.d

ADD master.conf /etc/salt/master.d/master.conf

CMD ["salt-master", "-l", "debug"]
