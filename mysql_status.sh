#!/bin/bash

#cron job setup with logging
#* * * * * ~/mysql_status.sh >> /var/log/mysql_status.log 2>&1
#once logging is enable it's nice to setup also logrotate 
#by adding file in logrotate config directory:

#nano /etc/logrotate.d/mysql-status

#content:

#/var/log/mysql_status.log {
#  rotate 7
#  daily
#  compress
#  missingok
#  notifempty
#  size 1M
#}


#cron job setup without logging
#* * * * * ~/mysql_status.sh 2>&1

S=`ps auxw | grep /usr/sbin/mysqld | grep -v grep | wc -l`

if [[ $S = 0 ]];
then
  echo "$(date) -  MySQL is stopped. Processes found: $S, restart attempt."
  sudo service mysql restart
else
  echo "$(date) -  MySQL is running fine. Processes found: $S"
fi
