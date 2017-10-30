echo -e "\t-------- installer.sh started --------" && \
bash download_iptalk_resources.sh && \
bash /home/pi/iptalk_rescources/scripts/main.sh && \
echo -e "\t-------- installer.sh finished --------"