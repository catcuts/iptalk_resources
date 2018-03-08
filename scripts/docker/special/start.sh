#!/usr/bin/bash

# 特殊情况处理
# 运行容器不进入，docker cp 把 src/* 复制到 <container-id>:/home/pi/src
# 进入容器
    # mkdir -p /home/pi/start/
    # 把本文件 start.sh 放到 /home/pi/start/
    # cp -rn /home/pi/src/data/* /home/pi/tmp/data
    # cp -rn /home/pi/src/settings/* /home/pi/tmp/settings
# 退出容器
# 提交生成新的镜像(以后都用这个新镜像)

#awk 'BEGIN { cmd="cp -ri /home/pi/tmp/data/* /home/pi/src/data"; print "n" |cmd; }'
#awk 'BEGIN { cmd="cp -ri /home/pi/tmp/settings/* /home/pi/src/settings"; print "n" |cmd; }'

# 在这里指定 mysql 连接参数
MYSQL_HOST="127.0.0.1"
MYSQL_PORT=3306
MYSQL_USERNAME="root"
MYSQL_PASSWORD="root"

while getopts "h:o:u:p:" arg  # 选项后面的冒号表示该选项需要参数
do
    case $arg in
        h)
            MYSQL_HOST=$OPTARG  # 参数存在 $OPTARG 中
            ;;
        o)
            MYSQL_PORT=$OPTARG
            ;;
        u)
            MYSQL_USERNAME=$OPTARG
            ;;
        p)
            MYSQL_PASSWORD=$OPTARG
            ;;
    esac
done

cp -rn /home/pi/tmp/data/* /home/pi/src/data
cp -rn /home/pi/tmp/settings/* /home/pi/src/settings

setting_file=/home/pi/src/settings/default.ini

if [[ $MYSQL_HOST ]]; then
    sed -in "s/^host\s*=\s*.*/host = $MYSQL_HOST/" $setting_file
fi

if [[ $MYSQL_PORT ]]; then
    sed -in "s/^port\s*=\s*.*/port = $MYSQL_PORT/" $setting_file
fi

if [[ $IPTALK_DATABASE ]]; then
    sed -in "s/^iptalkdatabase\s*=\s*.*/iptalkdatabase = $IPTALK_DATABASE/" $setting_file
fi

if [[ $MYSQL_USERNAME ]]; then
    sed -in "s/^user\s*=\s*.*/user = $MYSQL_USERNAME/" $setting_file
fi

if [[ $MYSQL_PASSWORD ]]; then
    sed -in "s/^password\s*=\s*.*/password = $MYSQL_PASSWORD/" $setting_file
fi

mkdir -p /var/run/sshd > /etc/null && \
/usr/sbin/sshd -D & \
sudo service mysql start > /home/pi/log.txt 2>&1 && \
python /home/pi/src/iptalk.py
