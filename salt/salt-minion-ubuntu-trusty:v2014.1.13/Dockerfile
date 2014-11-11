FROM ubuntu:trusty
MAINTAINER slafs

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q software-properties-common
RUN add-apt-repository -y ppa:saltstack/salt
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q salt-minion

# just in case
RUN mkdir -p /etc/salt/minion.d

ADD minion.conf /etc/salt/minion.d/minion.conf

CMD ["salt-minion", "-l", "debug"]

RUN apt-get clean
