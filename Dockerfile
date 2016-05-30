FROM ubuntu:14.04

MAINTAINER lzf <lzf@outlook.com>

RUN apt-get update

RUN apt-get install -y --force-yes libpcap-dev
RUN apt-get install -y --force-yes openjdk-7-jre

RUN apt-get install -y --force-yes openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password1' | chpasswd

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ADD client.jar /root/client.jar
ADD client_config.json /root/client_config.json
ADD port_map.json /root/port_map.json
ADD fs_restart.sh /fs_restart.sh

RUN chmod 755 /fs_restart.sh

EXPOSE 2001

CMD ["/usr/sbin/sshd", "-D"]