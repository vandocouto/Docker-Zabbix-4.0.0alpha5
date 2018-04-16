#!/bin/bash

sleep 30
echo "USE zabbix" |  mysql -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS

if [ $? -ne 0 ]; then

	cd /usr/share/doc/zabbix-server-mysql/
	echo "CREATE DATABASE zabbix" | mysql -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS
	zcat create.sql.gz | mysql zabbix -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS
	
	sed -i 's/$ZB_MYSQL_HOST/'$ZB_MYSQL_HOST'/g'    /etc/zabbix/zabbix_server.conf
	sed -i 's/$ZB_MYSQL_BD/'$ZB_MYSQL_BD'/g'        /etc/zabbix/zabbix_server.conf
	sed -i 's/$ZB_MYSQL_USER/'$ZB_MYSQL_USER'/g'    /etc/zabbix/zabbix_server.conf
 
fi

service zabbix-server start
service zabbix-agent start
/usr/sbin/apache2ctl -D FOREGROUND
