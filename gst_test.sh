GST_DEBUG=3 gst-launch-1.0 \
        tcambin \
        ! "video/x-raw, width=1280, height=720, framerate=30/1" \
        ! videoconvert \
        ! queue \
        ! x264enc key-int-max=60 tune=zerolatency \
        ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/x/t1bk-v8ap-grgs-c06g app=live2" \
        audiotestsrc wave=silence \
        ! voaacenc bitrate=128000 \
        ! mux.
        #! v4l2h264enc \
