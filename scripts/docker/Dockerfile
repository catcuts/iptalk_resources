FROM debian:latest

RUN \
# install all system dependencies
    apt-get update && apt-get install -y \
        gcc \
        git \
        wget \
        unzip \
        python \
        ntpdate \ 
        openssh-server && \

# mkdir all will be used
    mkdir -p 
        /home/pi/src \
        /home/pi/pkgs \
        /home/pi/ffmpeg && \

# correct the time zone
    echo "TZ='Asia/Shanghai'; export TZ" >> /root/.profile && \
    sudo timedatectl set-timezone Asia/Chongqing && \

# fetch and extract the ffmpeg into /home/pi then move to /home/pi/ffmpeg    
    cd /home/pi/packages
    wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz
    tar -Jxf ffmpeg-release-64bit-static.tar.xz && \
    mv ffmpeg-release-64bit-static.tar.xz /home/pi/ffmpeg && \

# install python packages
    # install setuptools  
        unzip /home/pi/iptalk_resources/packages/setuptools-36.6.0.zip -d /home/pi/pkgs && \
        python /home/pi/pkgs/setuptools-36.6.0/setup.py install && \

    # install pip 
        cd /home/pi/pkgs && \
        tar -xzf /home/pi/iptalk_resources/packages/pip-9.0.1.tar.gz && \
        python /home/pi/pkgs/pip-9.0.1/setup.py install && \
        type pip && \
        sleep 1 && \
        hash -r && \
        sleep 1 && \

    # install dev
        for dev in python-dev libmysqld-dev libffi-dev libssl-dev
        do
            found=`dpkg -l | grep $dev`
          if [ -z "$found" ]
            then sudo apt-get install -y $dev 
            fi
        done && \

    # install python packages from douban source image
        cat /home/pi/iptalk_resources/requirements.txt | while read pkg
        do
            pip install $pkg -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
        done && \

# extract iptalk server code into /home/pi/src
    wget ... -P /home/pi/ && \
    unzip /home/pi/iptalk.zip -d /home/pi/src && \

CMD /usr/sbin/sshd -D && /home/pi/src/start.sh && bash
