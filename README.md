# Docker Container Zabbix 3.2

* Deploy Docker Container Zabbix 3.2 
* Obs: Homologado para versão do Docker >= 1.12
<hr>
Clonando o projeto:
<pre>
$ git clone https://github.com/vandocouto/Docker_Container_Zabbix3.2.git
</pre>
* Passo 1 - Ajustando o permissionamento:
<pre>
$ cd Docker_Container_Zabbix3.2/
$ chmod -R 777 zabbix-logs/ mysql-logs/
$ sudo chown -R landscape:messagebus banco/
</pre>
* Passo 2 - Contruíndo a imagem:
<pre>
$ sudo docker build -f build/Dockerfile -t zabbix3_2-tutoriaisgnulinux .
</pre>
<hr>
* Passo 3 - Instando o Docker Compose:
<pre>
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
</pre>
* Passo 4 - Iniciando o Container:
<pre>
$ sudo docker-compose up -d
Starting zabbix3_2-tutoriaisgnulinux
</pre>
* Passo 5 - Verificando o ID do container
<pre>
$ sudo docker ps
CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                                                                                      NAMES
17bcabfb8b95        zabbix3_2-tutoriaisgnulinux   "/root/run.sh"      3 minutes ago       Up 50 seconds       0.0.0.0:80->80/tcp, 0.0.0.0:10051->10051/tcp, 3306/tcp, 127.0.0.1:2200->22/tcp, 0.0.0.0:32789->10050/tcp   zabbix3_2-tutoriaisgnulinux
</pre>
* Passo 6 - Acessando o container por SSH
<pre>
$ ssh root@127.0.0.1 -p2200
</pre>
* Passo 7 - Ajustando o Banco de Dados
<pre>
# mysql
MariaDB [(none)]> create database zabbix;
MariaDB [(none)]> grant all privileges on zabbix.* to 'zabbix'@'127.0.0.1' identified by 'zabbix';
MariaDB [(none)]> flush privileges;
</pre>
* Passo 8 - Ajustando o Zabbix Server
<pre>
# zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uzabbix -pzabbix -h 127.0.0.1 zabbix
</pre>
* Passo 8 - Iniciando o Zabbix Server
<pre>
# /etc/init.d/zabbix-server start
</pre>

* Passo 9 - Acessando o Zabbix Web
<pre>
http://IP/zabbix/
</pre>




