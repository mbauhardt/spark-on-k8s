#!/bin/sh

echo "$(hostname -i) spark-master" >> /etc/hosts

/opt/spark/sbin/start-master.sh -h spark-master

