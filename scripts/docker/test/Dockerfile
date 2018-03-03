# Dockerfile

FROM debian:latest

ENV \
    MYSQL_HOST="127.0.0.1" \
    MYSQL_PORT=3306 \
    IPTALK_DATABASE="iptalk" \
    MYSQL_USERNAME="root" \
    MYSQL_PASSWORD="root"

ADD ./iptalk.tar /home/pi/
COPY ./start.sh /home/pi/start/

RUN \

# install all system dependencies
apt-get update && install -y unzip \

# mkdir all will be used
    mkdir -p \
        /home/pi/src \
        /home/pi/pkgs \
        /home/pi/ffmpeg \
        /home/pi/tmp/data \
        /home/pi/tmp/settings && \

# correct the time zone
    # echo "TZ='Asia/Shanghai'; export TZ" >> /root/.profile && \
    # sudo timedatectl set-timezone Asia/Chongqing && \

# extract iptalk server code into /home/pi/src
    # unzip /home/pi/iptalk.zip -d /home/pi/src \
    cp -r /home/pi/src/data/* /home/pi/tmp/data && \
    cp -r /home/pi/src/settings/* /home/pi/tmp/settings 

CMD ["bash", "/home/pi/start/start.sh"]
