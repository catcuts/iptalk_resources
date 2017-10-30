# correct_timezone.sh
echo -e "\t-------- correct_timezone.sh started --------" && \
sudo apt-get update -y && \
sudo apt-get install -y ntpdate && \
echo "TZ='Asia/Shanghai'; export TZ" >> /root/.profile && \
sudo timedatectl set-timezone Asia/Chongqing && \
echo -e "\tplease check: " && \
cat /etc/timezone && \
date && \
echo -e "\t-------- correct_timezone.sh finished --------"
