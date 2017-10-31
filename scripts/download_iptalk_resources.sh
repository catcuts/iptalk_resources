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

rar > /etc/null
if [ $? -eq 0 ]
then echo -e "\tcopying src ..."
else 
	 echo -e "\tinstalling rarlinux ..." && \
	 cp -p /home/pi/iptalk_resources/packages/rarlinux.tar.gz /home/pi/packages/rarlinux.tar.gz && \
	 cd /home/pi/packages && \
	 tar -zxvf /home/pi/packages/rarlinux.tar.gz && \
	 cd /home/pi/packages/rarlinux && \
	 make && make install && \
     echo -e "\tgit installed. Copying src ..."
fi  && \

cp -p /home/pi/iptalk_resources/releases/iptalk.rar /home/pi/releases/iptalk.rar && \
cd /home/pi/releases && \
unrar /home/pi/releases/iptalk.rar && \
cp -p -r /home/pi/releases/iptalk/src /home/pi/src && \
cd /home/pi && \
echo -e "\tsrc copied to /home/pi." && \

echo -e "\t-------- download_iptalk_resources.sh fishished --------"
