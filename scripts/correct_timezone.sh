# correct_timezone.sh
echo -e "\t-------- correct_timezone.sh starting --------" && \
sudo apt-get update -y && \
sudo apt-get install -y ntpdate && \
echo "TZ='Asia/Shanghai'; export TZ" >> /root/.profile && \
sudo timedatectl set-timezone Asia/Chongqing && \
echo "\tplease check: " && \
cat /etc/timezone && \
date && \
echo -e "\t-------- correct_timezone.sh finished --------"