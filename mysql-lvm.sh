#!/bin/bash
LEVEL=$1

if [ "$LEVEL" == "start" ]
then
  echo "Start"
  if [ ! -d /home/mysqlbackup/mysql ]
	then
		#service mysql stop
		/usr/bin/mysqladmin flush-tables
		lvcreate -L50G -s -n mysqlbackup /dev/af/mysql
		mount -o ro /dev/af/mysqlbackup /home/mysqlbackup
		#service mysql start

	fi
else
  echo "Stop"
	umount /home/mysqlbackup
	lvremove -f /dev/af/mysqlbackup
fi
