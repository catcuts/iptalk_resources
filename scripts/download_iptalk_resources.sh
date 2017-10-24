# download_iptalk_resources.sh
echo -e "\t-------- download_iptalk_resources.sh started --------"
cd /home/pi && \
git > /etc/null
if [ $? -eq 0 ]
then echo "\tDownloading iptalk_resources ..."
else echo "\tinstalling git ..." && \
	 sudo apt-get update -y && \
	 sudo apt-get install git -y && \
     echo "\tgit installed. Downloading iptalk_resources"
fi  && \
git clone https://github.com/catcuts/iptalk_resources.git
if [ $? -ne 0 ]
then cd iptalk_resources && git pull 
fi && \
echo -e "\t-------- download_iptalk_resources.sh fishished --------"