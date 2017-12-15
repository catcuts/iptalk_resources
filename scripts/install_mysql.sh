# install_mysql.sh
echo -e "\t-------- install_mysql.sh started --------" && \
# sudo apt-get update -y && \
# sudo apt-get install -y mysql-server && \
sudo aptitude install -y mysql-server && \
mysql > /etc/null
if [ $? -eq 0 ]
then echo -e "\tERROR: mysql not install, caused by an unexpected error."
echo -e "\t-------- install_mysql.sh finished --------"
