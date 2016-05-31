FROM ubuntu:12.04

MAINTAINER lzf <lzf@outlook.com>

ADD client.jar /root/client.jar

EXPOSE 2001
EXPOSE 22

CMD ["/run.sh"]