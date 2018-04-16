#!/bin/bash
service mysql start

echo "SELECT user FROM mysql.user WHERE user='zabbix'" | mysql | grep -i zabbix

if [ $? -ne 0 ]; then

	echo "GRANT ALL PRIVILEGES ON *.* TO $ZB_MYSQL_USER@'$ZB_ZABBIX_IP' IDENTIFIED BY '$ZB_MYSQL_PASS'; " | mysql
	echo "FLUSH PRIVILEGES;" | mysql
fi

tail -f /var/log/mysql/error.log
