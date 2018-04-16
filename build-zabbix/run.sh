#!/bin/bash


sleep 30
echo "USE zabbix" |  mysql -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS

if [ $? -ne 0 ]; then
	cd /usr/share/doc/zabbix-server-mysql/
	echo "CREATE DATABASE zabbix" | mysql -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS
	zcat create.sql.gz | mysql zabbix -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS 
fi

service zabbix-server start
service zabbix-agent start
/usr/sbin/apache2ctl -D FOREGROUND
