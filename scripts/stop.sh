# bash /home/pi/src/stop.sh
pid=`pgrep -f test.py` && \
if [ $[`$pid >= 0`] ]
then
    echo "iptalk stopping ..." && \
    sudo kill -9 $pid && \
    echo "iptalk stopped."
fi
echo "system reboot ..."
#sudo shutdown -r now
