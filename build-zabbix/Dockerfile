FROM ubuntu:16.04

MAINTAINER Evandro Couto "vandocouto@gmail.com"

RUN apt-get update && apt-get upgrade -y && \
    apt-get install wget mysql-common python-pip locales vim apt-utils telnet mytop ifstat unzip mariadb-client iputils-ping net-tools tzdata -y && \
    wget http://repo.zabbix.com/zabbix/3.5/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.5-1+trusty_all.deb -P /opt && \
    dpkg -i /opt/zabbix-release_3.5-1+trusty_all.deb && \
    apt-get update -y && \
    wget http://launchpadlibrarian.net/284041029/libmysqlclient18_5.5.52-0ubuntu0.14.04.1_amd64.deb -P /opt && \ 
    dpkg -i /opt/libmysqlclient18_5.5.52-0ubuntu0.14.04.1_amd64.deb && \
    apt-get install zabbix-server-mysql zabbix-frontend-php zabbix-agent zabbix-get zabbix-sender snmp snmpd snmp-mibs-downloader php7.0-bcmath php7.0-xml php7.0-mbstring -y && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /zabbix && \
    pip install awscli --ignore-installed six && \
    echo 'export LANG=C' >> /etc/profile && \
    rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    chown -R zabbix.zabbix /etc/zabbix/ && \
    dpkg-reconfigure locales && \
    locale-gen pt_BR && \
    locale-gen pt_PT

COPY build-zabbix/run.sh     	/root
COPY build-zabbix/sudoers    	/etc
COPY build-zabbix/script.sh	/	

EXPOSE 80
EXPOSE 10050
EXPOSE 10051
