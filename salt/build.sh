#!/bin/bash

# build minions
for miniondir in $( ls -d salt-minion-* ); do
    docker build --rm=true -t slafs/$miniondir $miniondir
done

# build master
docker build --rm=true -t slafs/salt-master salt-master
