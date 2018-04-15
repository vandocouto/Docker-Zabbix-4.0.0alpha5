# imagem default
FROM ubuntu:16.04

MAINTAINER Evandro Couto "vandocouto@gmail.com"

RUN apt-get update -y ; apt-get upgrade -y && \
    apt-get install apt-utils telnet mytop vim ifstat unzip mariadb-server mariadb-client iputils-ping net-tools tzdata -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
    chown mysql:mysql /var/run/mysqld && \
    chown mysql:mysql /var/lib/mysql && \
    echo 'export LANG=C' >> /etc/profile && \
    rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

COPY build-mariadb/run.sh 	/run.sh
COPY build-mariadb/my.cnf 	/etc/mysql/
COPY build-mariadb/script.sh 	/
