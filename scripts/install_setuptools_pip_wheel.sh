# install_setuptools_pip_wheel.sh
sudo apt-get remove pip
sudo apt-get update && \
cd /home/pi && \
wget https://pypi.python.org/packages/45/29/8814bf414e7cd1031e1a3c8a4169218376e284ea2553cc0822a6ea1c2d78/setuptools-36.6.0.zip#md5=74663b15117d9a2cc5295d76011e6fd1 && \
wget https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz#md5=35f01da33009719497f01a4ba69d63c9 && \
unzip setuptools-36.6.0 && \
cd setuptools-36.6.0 && \
python setup.py install && \
cd /home/pi && \
tar -xzf pip-9.0.1.tar.gz && \
cd pip-9.0.1 && \
python setup.py install && \
type pip && \
sleep 1 && \
hash -r && \
sleep 1 && \
pip install wheel && \
echo "please check: " && \
pip list