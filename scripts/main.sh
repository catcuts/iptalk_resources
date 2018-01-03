echo -e "\t======== deployments started ========" && \
bash correct_timezone.sh && \
bash install_mysql.sh && \
bash config_mysql.sh && \
bash install_packages.sh && \
bash install_ffmpeg.sh && \
bash mkdir_data.sh && \
echo -e "\t======== deployments finished ========"
