# config_mysql.sh
echo -e "\t-------- config_mysql.sh started --------" && \
mysql -uroot -proot <<EOF
	use mysql;
	update user set host='%' where user='root' and host='localhost';
EOF
echo -e "\tMysql stopping ..." && \
sudo /etc/init.d/mysql stop && \
echo -e "\tMysql stopped. Mysql configing ..." && \
sudo cp -p /etc/mysql/my.cnf /etc/mysql/my.cnf.bkup && \
echo "" > /etc/mysql/my.cnf && \
cat iptalk_resources/configs/my.cnf | while read line
do
	echo $line >> /etc/mysql/my.cnf
done && \
echo -e "\tMysql configed. Mysql restarting ..." && \
sudo /etc/init.d/mysql start && \
echo -e "\tMysql restarted." && \
echo -e "\t-------- config_mysql.sh finished --------"