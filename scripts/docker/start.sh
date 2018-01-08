#!/usr/bin/bash

if [[ -e $MYSQL_HOST ]]; then
    sed "s/host\s*=\s*.*/host = $MYSQL_HOST/"
fi

if [[ -e $MYSQL_PORT ]]; then
    sed "s/port\s*=\s*.*/port = $MYSQL_HOST/"
fi

if [[ -e $IPTALK_DATABASE ]]; then
    sed "s/iptalkdatabase\s*=\s*.*/iptalkdatabase = $MYSQL_HOST/"
fi

if [[ -e $MYSQL_USERNAME ]]; then
    sed "s/user\s*=\s*.*/user = $MYSQL_HOST/"
fi

if [[ -e $IPTALK_PASSWORD ]]; then
    sed "s/password\s*=\s*.*/password = $MYSQL_HOST/"
fi

mkdir -p /var/run/sshd && \
/usr/sbin/sshd -D &
python /home/pi/src/test.py
