# correct_timezone.sh
sudo apt-get update -y && \
sudo apt-get install -y ntpdate && \
echo "TZ='Asia/Shanghai'; export TZ" >> /root/.profile && \
sudo timedatectl set-timezone Asia/Chongqing && \
echo "please check: " && \
cat /etc/timezone && \
date
