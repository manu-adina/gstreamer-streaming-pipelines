gst-launch-1.0 \
        aravissrc \
        ! "video/x-raw, format=GRAY8, width=640, height=480, framerate=30/1" \
        ! videoconvert \
        ! "video/x-raw, format=RGB" \
        ! v4l2h264enc \
        ! h264parse \
        ! flvmux streamable=true name=mux \
        ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/x/v2z1-4r5x-fzed-7vj1 app=live2" \
        audiotestsrc \
        ! voaacenc bitrate=128000 \
        ! mux.

