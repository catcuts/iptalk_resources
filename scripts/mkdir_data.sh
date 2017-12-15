echo -e "\t======== making directories for data started ========" && \
usbhdd_dir=/mnt/usbhdd
ftp_dir=${usbhdd}"/ftp"
for dir_name in "" devices ftp logs messages record traceCoords upgrade users
do
  dir=${usbhdd_dir}"/"${dir_name}
  if [ ! -d $dir ]
    then mkdir $dir
  fi
done && \
for dir_name in "" Advertising Alram Broadcast Record Upgrade VoiceBroadcast
do
  dir=${ftp_dir}"/"${dir_name}
  if [ ! -d $dir ]
    then mkdir $dir
  fi
done && \
echo -e "\t======== making directories for data finished ========"