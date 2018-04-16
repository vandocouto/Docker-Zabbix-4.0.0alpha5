#!/bin/bash

sleep 10
echo "USE zabbix" |  mysql -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS

if [ $? -ne 0 ]; then

	cd /usr/share/doc/zabbix-server-mysql/
	echo "CREATE DATABASE zabbix" | mysql -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS
	zcat create.sql.gz | mysql zabbix -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS
	
	sed -i 's/$ZB_MYSQL_HOST/'$ZB_MYSQL_HOST'/g'    			/etc/zabbix/zabbix_server.conf
	sed -i 's/$ZB_MYSQL_BD/'$ZB_MYSQL_BD'/g'        			/etc/zabbix/zabbix_server.conf
	sed -i 's/$ZB_MYSQL_USER/'$ZB_MYSQL_USER'/g'    			/etc/zabbix/zabbix_server.conf
	sed -i 's/$ZB_MYSQL_PASS/'$ZB_MYSQL_PASS'/g'    			/etc/zabbix/zabbix_server.conf
	sed -i 's/;date.timezone =/date.timezone=America\/Sao_Paulo/g'		/etc/php/7.0/apache2/php.ini
	sed -i 's/;date.timezone =/date.timezone=America\/Sao_Paulo/g'		/etc/php/7.0/cli/php.ini
        sed -i 's/$ZB_MYSQL_HOST/'$ZB_MYSQL_HOST'/g'				/usr/share/zabbix/conf/zabbix.conf.php
        sed -i 's/$ZB_MYSQL_BD/'$ZB_MYSQL_BD'/g'				/usr/share/zabbix/conf/zabbix.conf.php
        sed -i 's/$ZB_MYSQL_USER/'$ZB_MYSQL_USER'/g'				/usr/share/zabbix/conf/zabbix.conf.php
        sed -i 's/$ZB_MYSQL_PASS/'$ZB_MYSQL_PASS'/g'				/usr/share/zabbix/conf/zabbix.conf.php
        sed -i 's/$ZB_ZABBIX_HOST/'$ZB_ZABBIX_HOST'/g'				/usr/share/zabbix/conf/zabbix.conf.php
 
fi

service zabbix-server start
service zabbix-agent start
/usr/sbin/apache2ctl -D FOREGROUND
