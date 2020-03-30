gst-launch-1.0 \
        videotestsrc is-live=1 pattern=2 \
        ! videoconvert \
        ! "video/x-raw, width=1280, height=720, framerate=25/1" \
        ! queue \
        ! v4l2h264enc \
        ! h264parse \
        ! flvmux streamable=true name=mux \
        ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/${STREAM_KEY} app=live2" \
        audiotestsrc wave=sine \
        ! voaacenc bitrate=128000 \
        ! mux.
