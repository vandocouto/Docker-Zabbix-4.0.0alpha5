# Zabbix 3.5


```bash
docker build -f build-mariadb/Dockerfile -t mariadb:1.0.0 .
docker build -f build-zabbix/Dockerfile -t zabbix:1.0.0 .
```

```bash
docker volume create --name=mysql
docker volume create --name=zabbix
```
```bash
docker-compose up -d
```

```bash
docker exec -it mariadb bash
```

```bash
docker exec -it zabbix bash
```
