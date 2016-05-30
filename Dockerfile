FROM ubuntu:14.04

MAINTAINER lzf <lzf@outlook.com>

RUN apt-get update

RUN apt-get install -y --force-yes libpcap-dev
RUN apt-get install -y --force-yes openjdk-7-jre


ADD client.jar /root/client.jar
ADD client_config.json /root/client_config.json
ADD port_map.json /root/port_map.json
ADD fs_restart.sh /fs_restart.sh
ADD fs_start.sh /fs_start.sh
ADD root /var/spool/cron/crontabs/root

RUN chmod 755 /fs_restart.sh

EXPOSE 2001

CMD ["sh", "-c", "/fs_start.sh"]