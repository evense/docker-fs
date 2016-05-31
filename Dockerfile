FROM ubuntu:12.04

MAINTAINER lzf <lzf@outlook.com>

RUN apt-get update
RUN apt-get dist-upgrade -y 

RUN apt-get install -y --force-yes libpcap-dev
RUN apt-get install -y --force-yes openjdk-7-jre


ADD client.jar /root/client.jar
ADD client_config.json /root/client_config.json
ADD port_map.json /root/port_map.json
ADD fs_restart.sh /root/fs_restart.sh
ADD fs_start.sh /root/fs_start.sh

RUN chmod +x /root/fs_start.sh
RUN chmod +x /root/fs_restart.sh

EXPOSE 2001

CMD ["sh", "-c", "/root/fs_start.sh"]