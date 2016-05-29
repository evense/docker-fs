FROM ubuntu:14.04

MAINTAINER lzf <lzf@outlook.com>

RUN apt-get update

RUN apt-get install -y --force-yes libpcap-dev
RUN apt-get install -y --force-yes openjdk-7-jre

RUN apt-get install -y --force-yes openssh-server
RUN mkdir /var/run/sshd

RUN /bin/echo "root:123456" | chpasswd
RUN useradd runoob
RUN /bin/echo 'runoob:123456' |chpasswd

ADD client.jar /root/client.jar
ADD client_config.json /root/client_config.json
ADD port_map.json /root/port_map.json
ADD fs_restart.sh /root/fs_restart.sh
ADD root /var/spool/cron/crontabs/root

EXPOSE 2001
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]