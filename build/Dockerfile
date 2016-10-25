# imagem default
FROM ubuntu:14.04

# Responsável
MAINTAINER Evandro Couto "vandocouto@gmail.com"

# update e instalação de pacotes
RUN apt-get update -y ; apt-get upgrade -y && \
    apt-get install apt-utils wget openssh-server telnet mytop -y && \
    apt-get install vim ifstat unzip mariadb-server mariadb-client traceroute htop nmap python-mysqldb python-pip -y && \
    rm -rf /var/lib/apt/lists/*

# install zabbix 3.2
RUN wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+trusty_all.deb -P /opt && \
    dpkg -i /opt/zabbix-release_3.2-1+trusty_all.deb && \
    apt-get update -y && \
    apt-get install zabbix-server-mysql php5-mysql zabbix-frontend-php zabbix-agent zabbix-get zabbix-sender language-pack-es -y

# pip install aws cli
RUN pip install awscli --ignore-installed six

# limpando a imagem (container)
RUN rm -rf /var/lib/apt/lists/*

# ajustando o ssh server
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -y && \
    sed -ri 's/PermitRootLogin without-password/#PermitRootLogin without-password/g' /etc/ssh/sshd_config && \
    echo 'root:@senha-aqui' | chpasswd && \
    mkdir -p /var/run/sshd

# Exportando LANG=C
RUN echo 'export LANG=C' >> /etc/profile

# Copiando o script de inicialização e o sudoers
COPY build/run.sh     /root
COPY build/sudoers    /etc

# ajustando o /etc/passwd 
RUN sed -ri 's/zabbix:x:104:107::\/var\/lib\/zabbix\/:\/bin\/false/zabbix:x:104:107::\/etc\/zabbix\/:\/bin\/bash/g' /etc/passwd

# ajustando a permissão do diretório home do Zabbix.
RUN chown -R zabbix.zabbix /etc/zabbix/

# ajustando o localtime
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Ajustando o locales
RUN dpkg-reconfigure locales
RUN locale-gen pt_BR && \
    locale-gen pt_PT

# expose das portas
EXPOSE 22
EXPOSE 80
EXPOSE 10050
EXPOSE 10051
EXPOSE 3306

# script de inicialização
ENTRYPOINT ["/root/run.sh"]

