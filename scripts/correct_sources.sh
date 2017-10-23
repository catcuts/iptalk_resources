# correct_source.sh
sudo cp -p /etc/apt/sources.list /etc/apt/sources_bkup.list && \
echo -e "deb http://archive.raspbian.org/raspbian jessie main contrib non-free\ndeb-src http://archive.raspbian.org/raspbian jessie main contrib non-free" > /etc/apt/sources.list && \
sudo apt-get update -y && \
sudo apt-get upgrade -y && \