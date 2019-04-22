#!/bin/bash

#Setup of mysqldup command without  password prompt

#file:
#nano ~/.my.cnf

#content:
#[mysqladmin]
# user = username
# password = password
#[mysql]
# user = username
# password = password
#[mysqldump]
# user = username
# password = password

TODAY=$(date)
BUSER="root"
BFILE="/var/backups/all-databases.sql"
echo "-----------------------------------------------------"
echo "MySQL Backup Date: $TODAY                            "
echo "-----------------------------------------------------"
if [ -f $BFILE ]; then
  echo -e $"Delete old DB backup file rm $BFILE"
  rm $BFILE
else
   echo "File $BFILE does not exist yet."
fi
echo -e $"Run new MySQL backup  mysqldump --lock-all-tables -u$BUSER --all-databases > $BFILE"
mysqldump --lock-all-tables -u$BUSER --all-databases > $BFILE
END=$(date)
echo "-----------------------------------------------------"
echo "MySQL Backup End Date: $END                          "
echo "-----------------------------------------------------"