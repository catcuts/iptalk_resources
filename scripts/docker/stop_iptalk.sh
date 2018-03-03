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
