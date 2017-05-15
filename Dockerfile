FROM ubuntu:16.04

MAINTAINER Cesar Kastli <cesarkastli@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN \
#  sed -i 's/#\s*\(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y language-pack-en && \
  update-locale LANG=en_US.UTF-8 && \
  apt-get install -y supervisor postfix

ADD postfix.conf /etc/supervisor/conf.d/postfix.conf

ADD start.sh /opt/start.sh

RUN chmod +x /opt/start.sh

EXPOSE 25

CMD ["/opt/start.sh"]
