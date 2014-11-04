#!/bin/bash

for miniondir in $( ls -d salt-minion-* ); do
    docker build --rm=true -t slafs/$miniondir $miniondir
done

