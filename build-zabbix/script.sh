#!/bin/bash
cd /usr/share/doc/zabbix-server-mysql/
echo "CREATE DATABASE zabbix" | mysql -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS
zcat create.sql.gz | mysql zabbix -u $ZB_MYSQL_USER -h $ZB_MYSQL_HOST -p$ZB_MYSQL_PASS 
