pip > /etc/null
if [ $? -eq 0 ]
then echo "removing existed pip ..." && \
	 sudo apt-get remove pip -y && \
     echo "pip removed. Updating ..."
else echo "Updating ..."
fi  && \
sudo apt-get update -y && \
echo "updated. Changing dir to /home/pi" && \
cd /home/pi && \
echo "/home/pi: downloading setuptools and pip packages ..." && \
sudo cp -p /home/pi/iptalk_resources/packages/setuptools-36.6.0.zip /home/pi/setuptools-36.6.0.zip && \
sudo cp -p /home/pi/iptalk_resources/packages/pip-9.0.1.tar.gz /home/pi/pip-9.0.1.tar.gz && \
echo "/home/pi: setuptools and pip downloaded. Unziping setuptools ..." && \
unzip setuptools-36.6.0 && \
echo "/home/pi: setuptools unzipped. Changing dir to setuptools-36.6.0" && \
cd setuptools-36.6.0 && \
echo "/home/pi/setuptools-36.6.0: installing setuptools ..." && \
python setup.py install && \
echo "/home/pi/setuptools-36.6.0: setuptools installed. Changing dir to /home/pi ..." && \
cd /home/pi && \
echo "/home/pi: unpackaging pip ..." && \
tar -xzf pip-9.0.1.tar.gz && \
echo "/home/pi: pip unpackaged. Changing dir to pip-9.0.0 ..." && \
cd pip-9.0.1 && \
echo "/home/pi/pip-9.0.0: installing pip ..." && \
python setup.py install && \
echo "/home/pi/pip-9.0.0: pip installed. Correcting pip path" && \
type pip && \
sleep 1 && \
hash -r && \
sleep 1 && \
echo "/home/pi/pip-9.0.0: pip path corrected. Changing dir to /home/pi" && \
cd /home/pi && \
echo "/home/pi: installing wheel ..." && \
pip install wheel && \
echo "wheel installed. pip listing ..." && \
echo "please check: " && \
pip list