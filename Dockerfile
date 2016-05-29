FROM ubuntu:14.04

MAINTAINER lzf <lzf@outlook.com>

RUN apt-get update

RUN apt-get install -y --force-yes openssh-server
RUN mkdir /var/run/sshd

ADD run.sh /usr/local/bin/run.sh
ADD set_root_pw.sh /usr/local/bin/set_root_pw.sh
ADD client.jar /root/client.jar
ADD client_config.json /root/client_config.json
ADD port_map.json /root/port_map.json
ADD fs_restart.sh /usr/local/bin/fs_restart.sh
ADD root /var/spool/cron/crontabs/root

RUN chmod 755 /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/set_root_pw.sh
RUN chmod 755 /usr/local/bin/root/fs_restart.sh

EXPOSE 2001
EXPOSE 22

CMD ["sh", "run.sh"]