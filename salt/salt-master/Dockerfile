FROM ubuntu:trusty
MAINTAINER slafs

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common bash-completion
RUN add-apt-repository -y ppa:saltstack/salt
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q salt-master

# just in case
RUN mkdir -p /etc/salt/master.d

ADD master.conf /etc/salt/master.d/master.conf

CMD ["salt-master", "-l", "debug"]

# uncomment bash autocompletion on root
RUN sed -i '97,99 s/^#//' /root/.bashrc

# clean
RUN apt-get clean
