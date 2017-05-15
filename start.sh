#!/bin/bash

[ -z "${FORWARDED_DOMAINS}" ] && echo "FORWARDED_DOMAINS is not set" && exit 1
[ -z "${FORWARD_TO}" ] && echo "FORWARD_TO is not set" && exit 1

for domain in $FORWARDED_DOMAINS; do
  echo "@$domain $FORWARD_TO" >> /etc/postfix/virtual
done

postmap /etc/postfix/virtual

postconf -e virtual_alias_domains=$FORWARDED_DOMAINS
postconf -e virtual_alias_maps=hash:/etc/postfix/virtual

supervisord -n -c /etc/supervisor/supervisord.conf
