#!/bin/ksh
Broker_name=$1
#$Broker_name
# Script to start|stop|restart|force-stop|status  ---------------
#PATH=/var/tmp/$Broker_name
echo **************Artemis service in $Broker_name  $2 inprogres*****************

/var/tmp/$Broker_name/bin/artemis-service $2
