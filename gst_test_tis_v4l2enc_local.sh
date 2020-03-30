gst-launch-1.0 \
        tcambin \
        ! videoconvert \
        ! "video/x-raw, width=1920, height=1080, framerate=25/1" \
        ! queue \
        ! v4l2h264enc \
        ! h264parse \
        ! flvmux streamable=true name=mux \
        ! rtmpsink location="rtmp://192.168.0.110/live/test" \
        audiotestsrc \
        ! voaacenc bitrate=128000 \
        ! mux.
