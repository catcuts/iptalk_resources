# install_packages.sh
# check whether it is needed to removing existed low-version pip
echo -e "\t-------- install_packages.sh started --------" && \
dpkg -l pip > /etc/null
if [ $? -eq 0 ]
then echo "removing existed pip ..." && \
	 sudo apt-get remove -y pip && \
     echo "pip removed. Updating ..."
else echo "Updating ..."
fi  && \

# update 
sudo apt-get update -y && \
echo "updated. Changing dir to /home/pi ..." && \

# download setuptools and packages
cd /home/pi && \
echo "/home/pi: " && \
echo -e "\tdownloading setuptools and pip packages ..." && \
sudo cp -p /home/pi/iptalk_resources/packages/setuptools-36.6.0.zip /home/pi/setuptools-36.6.0.zip && \
sudo cp -p /home/pi/iptalk_resources/packages/pip-9.0.1.tar.gz /home/pi/pip-9.0.1.tar.gz && \
echo -e "\tsetuptools and pip packages downloaded. Changing dir to /home/pi/packages ..." && \

# install setuptools first
cd /home/pi/packages && \
echo "/home/pi/packages: " && \
echo -e "\tUnziping setuptools ..." && \
unzip -o setuptools-36.6.0 && \
echo -e "\tsetuptools unzipped. Changing dir to setuptools-36.6.0" && \
cd setuptools-36.6.0 && \
echo "/home/pi/packages/setuptools-36.6.0: "
echo -e "\t\tinstalling setuptools ..." && \
python setup.py install && \
echo -e "\t\tsetuptools installed. Changing dir to /home/pi/packages ..." && \

# install pip after setuptools
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

# install other dependencies python packages for iptalk application
cd /home/pi/iptalk_resources && \
echo "/home/pi/iptalk_resources: " && \
echo -e "\tinstalling packages ..." && \
cat requirements.txt | while read line
do
	echo -e "---------- ---------- ----------" && \
   	echo -e "\tinstalling" $line " ..." && \
   	pkg=`tr A-Z a-z <<< $line`
   	if [ pkg == twisted ]
   	then sudo apt-get install -y python-Twisted
   	else sudo pip install --no-index --find-links=/home/pi/iptalk_resources/packages $line 
   	fi && \
   	echo -e "\t" $line " installed." 
done && \
echo -e "\t-------- all pkgs installed --------" && \

# finnally check
echo "please check: " && \
pip list && \
echo -e "\t-------- install_packages.sh finished --------"
