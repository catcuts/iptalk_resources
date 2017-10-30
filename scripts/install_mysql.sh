# install_mysql.sh
echo -e "\t-------- install_mysql.sh started --------" && \
sudo apt-get update -y && \
sudo aptitude install -y mysql-server && \
#sudo apt-get install -y mysql-server && \
echo -e "\t-------- install_mysql.sh finished --------"
