pip > /etc/null
if [ $? -eq 0 ]
then echo "removing existed pip ..." && \
	 sudo apt-get remove pip -y && \
     echo "pip removed. Updating ..."
else echo "Updating ..."
fi  && \

sudo apt-get update -y && \
echo "updated. Changing dir to /home/pi ..." && \

cd /home/pi && \
echo "/home/pi: " && \
echo -e "\tdownloading setuptools and pip packages ..." && \
sudo cp -p /home/pi/iptalk_resources/packages/setuptools-36.6.0.zip /home/pi/setuptools-36.6.0.zip && \
sudo cp -p /home/pi/iptalk_resources/packages/pip-9.0.1.tar.gz /home/pi/pip-9.0.1.tar.gz && \
echo -e "\tsetuptools and pip packages downloaded. Changing dir to /home/pi/packages ..." && \

cd /home/pi/packages && \
echo "/home/pi/packages: " && \
echo -e "\tUnziping setuptools ..." && \
unzip setuptools-36.6.0 && \
echo -e "\tsetuptools unzipped. Changing dir to setuptools-36.6.0" && \
cd setuptools-36.6.0 && \
echo "/home/pi/packages/setuptools-36.6.0: "
echo -e "\t\tinstalling setuptools ..." && \
python setup.py install && \
echo -e "\t\tsetuptools installed. Changing dir to /home/pi/packages ..." && \

cd /home/pi/packages && \
echo "/home/pi/packages: " && \
echo -e "\tunpackaging pip ..." && \
tar -xzf pip-9.0.1.tar.gz && \
echo -e "\tpip unpackaged. Changing dir to pip-9.0.0 ..." && \
cd pip-9.0.1 && \
echo "/home/pi/packages/pip-9.0.0: " && \
echo -e "\t\tinstalling pip ..." && \
python setup.py install && \
echo -e "\t\tpip installed. Correcting pip path" && \
type pip && \
sleep 1 && \
hash -r && \
sleep 1 && \
echo -e "\t\tpip path corrected. Changing dir to /home/pi/iptalk_resources ..." && \

cd /home/pi/iptalk_resources && \
echo "/home/pi/iptalk_resources: " && \
echo -e "\tinstalling packages ..." && \
cat /home/pi/peptides.txt | while read line
do
	echo -e "---------- ---------- ----------" && \
   	echo -e "\tinstalling " $line " ..." && \
   	sudo pip install --no-index --find-links=/home/pi/iptalk_resources/packages $line && \
   	echo -e "\t" $line " installed." 
done && \
echo -e "\t-------- all pkgs installed --------" && \

echo "please check: " && \
pip list