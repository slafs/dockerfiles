FROM ubuntu-upstart:trusty
MAINTAINER slafs

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q curl patch

RUN curl -L -o /tmp/bootstrap_salt.sh http://bootstrap.saltstack.org

ADD no_services_patch.diff /tmp/

# fixed patch https://github.com/saltstack/salt-bootstrap/pull/455 for most recent bootstrap script
RUN patch /tmp/bootstrap_salt.sh /tmp/no_services_patch.diff

ENV RUNLEVEL 2
RUN ln -s /etc/rc2.d /etc/rc.d

RUN bash /tmp/bootstrap_salt.sh -d -M -S -D -X -U -P git v2014.7.0

# just in case
RUN mkdir -p /etc/salt/minion.d

ADD minion.conf /etc/salt/minion.d/minion.conf

# make salt-minion start with init
RUN sed -i '3,5 s/^/#/' /etc/init/salt-minion.conf
RUN sed -i '6 s/^/start on runlevel [2345]\n/' /etc/init/salt-minion.conf

#CMD ["salt-minion", "-l", "debug"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
