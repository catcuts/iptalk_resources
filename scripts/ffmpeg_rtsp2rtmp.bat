start cmd /c ffmpeg -rtsp_transport tcp -re -i "rtsp://192.168.116.248:554/cam/realmonitor?channel=1&subtype=0&unicast=true&proto=Onvif" -vcodec copy -acodec copy -f flv rtmp://192.168.116.32:1935/live/192.168.8.250
start cmd /c ffmpeg -rtsp_transport tcp -re -i "rtsp://192.168.117.165/meeyi" -vcodec copy -acodec copy -f flv rtmp://192.168.116.32:1935/live/192.168.8.40
start cmd /c ffmpeg -rtsp_transport tcp -re -i "rtsp://192.168.117.65/meeyi" -vcodec copy -acodec copy -f flv rtmp://192.168.116.32:1935/live/192.168.8.41
start cmd /c ffmpeg -rtsp_transport tcp -re -i "rtsp://192.168.8.89/meeyi" -vcodec copy -acodec copy -f flv rtmp://192.168.116.32:1935/live/192.168.8.42
start cmd /c ffmpeg -rtsp_transport tcp -re -i "rtsp://192.168.117.65/meeyi" -vcodec copy -acodec copy -f flv rtmp://192.168.116.32:1935/live/192.168.8.43
