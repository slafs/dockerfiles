#!/bin/bash

# build minions
for miniondir in $( ls -d salt-minion-* ); do
    docker build --rm=true -t slafs/$miniondir $miniondir
done

# build masters
for masterdir in $( ls -d salt-master-* ); do
    docker build --rm=true -t slafs/$masterdir $masterdir
done
