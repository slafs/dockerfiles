============================================
Centos 7 with systemd on unprivileged Docker
============================================

This is a base **Docker** image for **CentOS 7** with installed **systemd**
(instead of ``fakesystemd``). It can be ran without ``-- privileged`` flag.

As of **2014-11-17 00:00 UTC** this actually works ;)

For reference about creating/running this image see:

* http://developerblog.redhat.com/2014/05/05/running-systemd-within-docker-container/
* https://bugzilla.redhat.com/show_bug.cgi?id=1033604

This image is based on work in https://github.com/maci0/docker-systemd-unpriv (without ``sshd``)

Build it like this::

    docker build --rm=true -t slafs/centos7-systemd .

Then run it like this::

    docker run -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro slafs/centos7-systemd /usr/lib/systemd/systemd


Systemd
=======

Currently I've noticed some issues after installing various services.

For example:

* when installing ``postgres`` you should comment out ``OOMScoreAdjust`` option from ``.service`` file. 
* When installing ``httpd`` (apache) comment out ``PrivateTmp`` option from ``/usr/lib/systemd/system/httpd.service``.

Keep in mind that there might be other caveats.

Docker automated build
======================

You can find a Docker automated build here: https://registry.hub.docker.com/u/slafs/centos7-systemd/
