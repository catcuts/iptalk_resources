#!/usr/bin/bash

awk 'BEGIN { cmd="cp -ri /home/pi/tmp/data/* /home/pi/src/data"; print "n" |cmd; }'
awk 'BEGIN { cmd="cp -ri /home/pi/tmp/settings/* /home/pi/src/settings"; print "n" |cmd; }'

setting_file=/home/pi/src/settings/default.ini

echo $MYSQL_HOST
echo $MYSQL_PORT
echo $IPTALK_DATABASE
echo $MYSQL_USERNAME
echo $IPTALK_PASSWORD

if [[ -e $MYSQL_HOST ]]; then
    sed "s/host\s*=\s*.*/host = $MYSQL_HOST/" $setting_file
fi

if [[ -e $MYSQL_PORT ]]; then
    sed "s/port\s*=\s*.*/port = $MYSQL_PORT/" $setting_file
fi

if [[ -e $IPTALK_DATABASE ]]; then
    sed "s/iptalkdatabase\s*=\s*.*/iptalkdatabase = $IPTALK_DATABASE/" $setting_file
fi

if [[ -e $MYSQL_USERNAME ]]; then
    sed "s/user\s*=\s*.*/user = $MYSQL_USERNAME/" $setting_file
fi

if [[ -e $IPTALK_PASSWORD ]]; then
    sed "s/password\s*=\s*.*/password = $IPTALK_PASSWORD/" $setting_file
fi
