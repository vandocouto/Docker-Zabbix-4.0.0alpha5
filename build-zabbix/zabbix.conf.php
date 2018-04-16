<?php
// Zabbix GUI configuration file.
global $DB;

$DB['TYPE']     = 'MYSQL';
$DB['SERVER']   = '$ZB_MYSQL_HOST';
$DB['PORT']     = '0';
$DB['DATABASE'] = '$ZB_MYSQL_BD';
$DB['USER']     = '$ZB_MYSQL_USER';
$DB['PASSWORD'] = '$ZB_MYSQL_PASS';

// Schema name. Used for IBM DB2 and PostgreSQL.
$DB['SCHEMA'] = '';

$ZBX_SERVER      = '$ZB_ZABBIX_HOST';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = '';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
