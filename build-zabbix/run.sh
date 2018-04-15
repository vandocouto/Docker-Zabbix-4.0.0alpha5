#!/bin/bash

/etc/init.d/ssh start
/etc/init.d/zabbix-server start
/etc/init.d/zabbix-agent start
/etc/init.d/apache2 start
/usr/bin/mysqld_safe

