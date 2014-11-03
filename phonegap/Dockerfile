FROM webratio/phonegap

MAINTAINER slafs

RUN groupadd -r slafs -g 1000
RUN mkdir /tmp/slafs
RUN useradd -r -u 1000 -g 1000 -d /tmp/slafs -c "Docker image user" slafs
RUN chmod g+rX /root
RUN chown -R :slafs /root
RUN chown -R slafs:slafs /tmp/slafs

USER slafs

