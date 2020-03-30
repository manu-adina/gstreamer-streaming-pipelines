gst-launch-1.0 \
        tcambin \
        ! videoconvert \
        ! "video/x-raw, width=1920, height=1080, framerate=25/1" \
        ! queue \
        ! v4l2h264enc \
        ! h264parse \
        ! flvmux streamable=true name=mux \
        ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/${STREAM_KEY} app=live2" \
        audiotestsrc \
        ! voaacenc bitrate=128000 \
        ! mux.
