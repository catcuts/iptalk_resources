#!/usr/bin/bash

docker ps > /etc/null
if [ $? -ne 0 ]
then
    echo -e "\tdocker service is starting ..."
    service docker start
    echo -e "\tdocker service started."
fi && \
echo -e "\tiptalk stopping ..."
docker stop iptalk > /etc/null 2>&1
docker rm iptalk > /etc/null 2>&1
echo -e "\tiptalk restarting ..."
docker run -it \
-p 21:21 \
-p 10022:22 \
-p 85:85 \
-p 89:89 \
-p 90:90 \
-p 3456:3456 \
-p 3478:3478 \
-p 3550:3550 \
-p 12200:12200 \
-p 12345:12345 \
-p 13980:13980 \
-p 34952:34952 \
-p 34955:34955 \
-v /home/iptalk:/home/pi/src \
--link iptalk-mysql \
--name iptalk iptalk:20180227