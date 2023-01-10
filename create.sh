#!/bin/ksh

#PATH=/opt/artemis/apache-artemis-2.27.0

Broker_name=$1

cd /opt/artemis/apache-artemis-2.27.0/bin
#echo enter Broker_name

$Broker_name
# This will create the broker in given path 

./artemis create /var/tmp/$Broker_name --user admin --password admin --allow-anonymous

# You can now start the broker by executing below

/var/tmp/$Broker_name/bin/artemis-service start

#./artemis-service start
