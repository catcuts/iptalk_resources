echo -e "\t======== deployments started ========" && \
bash correct_timezone.sh && \
bash correct_source.sh && \
bash install_mysql.sh && \
bash config_mysql.sh && \
bash install_packages.sh && \
echo -e "\t======== deployments finished ========"
