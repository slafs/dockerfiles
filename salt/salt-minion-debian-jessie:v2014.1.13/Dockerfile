FROM debian:jessie
MAINTAINER slafs

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q wget
RUN echo "deb http://debian.saltstack.com/debian jessie-saltstack main" > /etc/apt/sources.list.d/salt.list
RUN wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q salt-minion

# just in case
RUN mkdir -p /etc/salt/minion.d

ADD minion.conf /etc/salt/minion.d/minion.conf

CMD ["salt-minion", "-l", "debug"]

RUN apt-get clean
