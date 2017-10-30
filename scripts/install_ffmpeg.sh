echo -e "\t-------- install_ffmpeg.sh started --------" && \
# download ffmpeg
cd /home/pi && \
echo "/home/pi: " && \
echo -e "\tdownloading ffmpeg ..." && \
sudo cp -p /home/pi/iptalk_resources/packages/ffmpeg-release-armel-32bit-static.tar.xz /home/pi/ffmpeg.tar.xz && \
echo -e "\tffmpeg downloaded. Unpackaging ffmpeg ..." && \
tar -Jxf ffmpeg.tar.xz && \
echo -e "\tffmpeg unpackaged. Static ffmpeg is ready for use." && \
echo -e "\t-------- install_ffmpeg.sh finished --------" && \