#!/bin/sh

sp=`df /var | grep -v Use | awk '{print $5}' | cut -d'%' -f1`
if [ $sp -gt "90" ]
then
/bin/mail -s "SYSLOG Server Partition Over 90%" <recipient email> <<EOM
----- WARNING! ------
Server /var partition is over 90% full
EOM
fi
