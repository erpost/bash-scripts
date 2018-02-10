#!/bin/bash

compress_date=`date --date="4 months ago" +%Y.%m`
purge_date=`date --date="12 months ago" +%Y.%m`



gzip -qr /var/log/networklogs/hosts/$compress_date

echo -e "\nDirectory Compressed: " /var/log/networklogs/hosts/$compress_date > /tmp/compress_logs.txt
echo -e "\nDirectory Purged: " /var/log/networklogs/hosts/$purge_date >> /tmp/compress_logs.txt
echo -e "\nFiles Compressed: " `find /var/log/networklogs/hosts/$compress_date -name \*.gz | wc -l` >> /tmp/compress_logs.txt
echo -e "\n\nThe following files were not compressed:\n\n" >> /tmp/compress_logs.txt
find /var/log/networklogs/hosts/$compress_date -name \*.log >> /tmp/compress_logs.txt
cat /tmp/compress_logs.txt|mail -s 'Monthly Log Compression' <recipient email> -- -f<sender email>

rm -rf /var/log/networklogs/hosts/$purge_date
rm -f /tmp/compress_logs.txt

exit
