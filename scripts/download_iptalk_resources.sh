# download_iptalk_resources.sh
cd /home/pi && \
git > /etc/null
if [ $? -eq 0 ]
then echo "Downloading iptalk_resources"
else echo "installing git ..." && \
	 sudo apt-get update -y && \
	 sudo apt-get install git -y && \
     echo "git installed. Downloading iptalk_resources"
fi  && \
git clone https://github.com/catcuts/iptalk_resources.git