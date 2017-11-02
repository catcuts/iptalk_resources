# active_ufw.sh
echo -e "\t-------- active_ufw.sh started --------" && \

ufw status > /etc/null
if [ $? -eq 0 ]
then echo -e "\tufw configing ..."
else 
	 echo -e "\tinstalling ufw ..." && \
	 sudo apt-get update -y && \
	 sudo apt-get install -y --force-yes ufw && \
     echo -e "\tufw installed. ufw configing ..."
fi  && \

sudo ufw enable && \
sudo ufw default deny && \
sudo ufw allow from 10.0.0.0/8 && \
sudo ufw allow from 172.16.0.0/12 && \
sudo ufw allow from 192.168.0.0/16 && \

echo -e "\t-------- active_ufw.sh started --------"