FROM ubuntu:14.04

MAINTAINER lzf <lzf@outlook.com>

RUN apt-get update

RUN apt-get install -y --force-yes libpcap-dev
RUN apt-get install -y --force-yes openjdk-7-jre

RUN echo "root:123456" | chpasswd

RUN mkdir -p /root/fs
ADD client.jar /root/fs/client.jar
ADD client_config.json /root/fs/client_config.json
ADD port_map.json /root/fs/port_map.json
ADD fs_restart.sh /root/fs_restart.sh
ADD root /var/spool/cron/crontabs/root

EXPOSE 2001
EXPOSE 22

CMD sh /root/fs_restart.sh