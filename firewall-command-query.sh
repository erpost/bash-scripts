#!/bin/sh


echo ------------------------------------------------------------
echo '|This Script Will Query the Firewall for Executed Commands.|'
echo ------------------------------------------------------------

echo -e '\n'
echo What is the IP of the Firewall?
read firewallip
echo What year [yyyy]?
read year
echo What month [mm]?
read month
echo What day [dd]?
read day
echo What email would you like this report sent to?
read email

echo -e '\n\n'
echo -----------------------------------------
echo '|             END RESULT                |'
echo -----------------------------------------
grep executed /var/log/networklogs/hosts/$year.$month/$firewallip/$firewallip-$year.$month.$day.log | tee /tmp/firewallquery.txt
echo -----------------------------------------

cat /tmp/firewallquery.txt|mail -s 'Executed Commands for '$firewallip' ' $email -- -f<sender@example.com>

rm -f /tmp/firewallquery.txt

echo -e '\n'
echo 'A copy of this file has also been sent to '$email'.'
echo -e '\n'
