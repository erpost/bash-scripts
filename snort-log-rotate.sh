#!/bin/bash -x
/sbin/service snortd stop
cd /var/log/snort
d=`date +"%Y%m%d"`
mv /var/log/snort/alert /var/log/snort/archive/alert.$d
for i in `ls -1 /var/log/snort/*.log*`;
do
       /usr/sbin/tcpdump -Xnntttt -r $i 2>>/var/log/snort/error >> /var/log/snort/archive/snort.log.$d
       rm $i
done
/sbin/service snortd start
