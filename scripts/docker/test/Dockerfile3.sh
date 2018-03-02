# Dockerfile3 for test start.sh

FROM debian:latest

ENV \
    MYSQL_HOST="127.0.0.1" \
    MYSQL_PORT=3306 \
    IPTALK_DATABASE="iptalk" \
    MYSQL_USERNAME="root" \
    MYSQL_PASSWORD="root"

COPY ./start.sh /home/tmp/

CMD ["bash", "/home/tmp/start.sh"]