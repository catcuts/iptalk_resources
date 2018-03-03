#!/usr/bin/bash

echo -e "\tiptalk-mysql stopping ..."
docker stop iptalk-mysql > /etc/null 2>&1
docker rm iptalk-mysql > /etc/null 2>&1
echo -e "\tiptalk-mysql stopped."
