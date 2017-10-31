# download_iptalk_resources.sh
echo -e "\t-------- download_iptalk_resources.sh started --------" && \
cd /home/pi && \

git > /etc/null
if [ $? -eq 0 ]
then echo -e "\tDownloading iptalk_resources ..."
else 
	 echo -e "\tinstalling git ..." && \
	 sudo apt-get update -y && \
	 sudo apt-get install -y git && \
     echo -e "\tgit installed. Downloading iptalk_resources ..."
fi  && \

git clone https://github.com/catcuts/iptalk_resources.git
if [ $? -ne 0 ]
then cd iptalk_resources && git pull 
fi && \
echo -e "\tiptalk_resources downloaded. Copying src to /home/pi ..."

# 解压太慢了, 还是手动用FileZilla吧
# unrar-free --help > /etc/null
# if [ $? -eq 0 ]
# then echo -e "\tcopying src ..."
# else 
# 	 echo -e "\tinstalling unrar-free ..." && \
# 	 apt-get install -y unrar-free && \
# 	 # cp -p /home/pi/iptalk_resources/packages/rarlinux-5.5.0.tar.gz /home/pi/packages/rarlinux-5.5.0.tar.gz && \
# 	 # cd /home/pi/packages && \
# 	 # tar -zxvf /home/pi/packages/rarlinux-5.5.0.tar.gz && \
# 	 # cd /home/pi/packages/rar && \
# 	 # make && make install && \
#      echo -e "\tunrar-free installed. Copying src ..."
# fi && \

# cp -p /home/pi/iptalk_resources/releases/iptalk.rar /home/pi/releases/iptalk.rar && \
# cd /home/pi/releases && \
# unrar-free -x /home/pi/releases/iptalk.rar && \
# cp -p -r /home/pi/releases/iptalk/src /home/pi && \
# cd /home/pi && \
# echo -e "\tsrc copied to /home/pi." && \

echo -e "\t-------- download_iptalk_resources.sh fishished --------"
