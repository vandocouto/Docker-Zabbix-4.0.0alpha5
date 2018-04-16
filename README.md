# Zabbix 3.5

Step 1 - Build Images MariaDB and Zabbix
```bash
docker build -f build-mariadb/Dockerfile -t mariadb:1.0.0 .
docker build -f build-zabbix/Dockerfile -t zabbix:1.0.0 .
```
Step 2 - Create volume mysql and zabbix
```bash
docker volume create --name=mysql
docker volume create --name=zabbix
```
Step 3 - UP Stack (MariaDB and Zabbix)
```bash
docker-compose up -d
```
Step 4 - Access Container MariaDB
```bash
docker exec -it mariadb bash
```
Step 5 - Access Container Zabbix
```bash
docker exec -it zabbix bash
```
Step 6 - Access Zabbix url
**http://IP/zabbix**
