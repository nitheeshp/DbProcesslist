#!/bin/bash
#Show how many active connections there are to mysql 
active=$(netstat -an | grep 3306 | wc -l)
echo $active
number=30
echo $number
# If mysql connection is more than 30 It will log into mysql and run the process list command and redirect output log file
if [ "$active" -ge "$number" ] 
then
    mysql -u master -pyourpassword -hyourmysqlhostname -e "show full processlist" > /usr/local/nitheesh/dbprocess/processlist-`date +%F-%H:%M`.log
else
    echo "Number of connection is less"
fi
