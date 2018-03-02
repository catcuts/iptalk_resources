#!/usr/bin/bash

pid=`pgrep -f test.py` && \
if [ $[`$pid >= 0`] ]
then
    echo "iptalk stopping ..." && \
    sudo kill -9 $pid && \
    echo "iptalk stopped."
fi && \
docker stop iptalk > /etc/null 2>&1
docker rm iptalk > /etc/null 2>&1

# restart-iptalk-mysql.sh
echo -e "\tiptalk-mysql stopping ..."
docker stop iptalk-mysql > /etc/null 2>&1
docker rm iptalk-mysql > /etc/null 2>&1
echo -e "\tiptalk-mysql restarting ..."
docker run --name iptalk-mysql \
-v /home/iptalk/mysql:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=root -d mysql:5.7 \
--character-set-server=utf8 \
--collation-server=utf8_unicode_ci
# --character-set-client=utf8 \
# --character-set-connection=utf8 \
# --character-set-database=utf8 \
# --character-set-results=utf8 \
# --character-set-system=utf8 \