FROM ubuntu:trusty
MAINTAINER slafs

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q curl patch bash-completion

RUN curl -L -o /tmp/bootstrap_salt.sh http://bootstrap.saltstack.org

ADD no_services_patch.diff /tmp/

# fixed patch https://github.com/saltstack/salt-bootstrap/pull/455 for most recent bootstrap script
RUN patch /tmp/bootstrap_salt.sh /tmp/no_services_patch.diff

ENV RUNLEVEL 2
RUN ln -s /etc/rc2.d /etc/rc.d

RUN bash /tmp/bootstrap_salt.sh -d -M -S -D -X -U -P git v2014.7.0

# just in case
RUN mkdir -p /etc/salt/master.d

ADD master.conf /etc/salt/master.d/master.conf

# make salt-master start with init (this is redundant cause we don't have upstart here)
RUN sed -i '3,5 s/^/#/' /etc/init/salt-master.conf
RUN sed -i '6 s/^/start on runlevel [2345]\n/' /etc/init/salt-master.conf

# bash autocompletion
ADD salt.bash /tmp/salt.bash
RUN cp /tmp/salt.bash /etc/bash_completion.d/salt.bash
# uncomment bash autocompletion on root
RUN sed -i '97,99 s/^#//' /root/.bashrc

CMD ["salt-master", "-l", "debug"]

ENV HOME /root
ENV TERM xterm

# clean
RUN apt-get clean

VOLUME /salt
