# Docker Container Zabbix 3.2

* Deploy Docker Container Zabbix 3.2 

# Projeto:
- Obs: Homologado para versão do Docker >= 1.12
<hr>
## Passo 1 - Contrua a imagem com o comando abaixo:
<pre>
docker build -f build/Dockerfile -t zabbix3_2-tutoriaisgnulinux .
</pre>
<hr>
## Passo 2 - Instale o Docker Compose:
<pre>
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
</pre>




