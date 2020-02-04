#!/bin/sh

iplist=`cat adonisip.txt`

rm -f adonis.full.log
rm -f adonis.log

echo -e '\n'
echo -----------------------------------------------------------------------------
echo '|This Script Will Change the ROOT and ADMIN Passwords for BlueCat Adonis Devices.|'
echo -----------------------------------------------------------------------------
echo -e '\n'
echo What is the current ROOT password?
read currentrootpw
echo What is the new ROOT password?
read newrootpw
echo What is the new ADMIN password?
read newadminpw

for ip in $iplist

do
   expect ./adonis.exp $ip $currentrootpw $newrootpw $newadminpw 2>&1 | tee -a adonis.full.log
done

grep '\&' adonis.full.log | sed 's/&//g' | cut -d# -f2 | sed 's/^ //g' |  sort -rn > adonis.log

echo -e '\n\n'
echo -----------------------------------------
echo '|             END RESULT                |'
echo -----------------------------------------
cat adonis.log
echo -----------------------------------------
echo -e '\n'
echo 'Output can also be found in the file: adonis.log'
echo -e '\n'
