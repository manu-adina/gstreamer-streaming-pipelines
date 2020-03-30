gst-launch-1.0 \
        tcambin \
        ! videoconvert \
        ! "video/x-raw, width=1280, height=720, framerate=25/1" \
        ! queue \
        ! x264enc bitrate=2000 byte-stream=false key-int-max=60 bframes=0 aud=true tune=zerolatency ! "video/x-h264,profile=main" \
        ! flvmux streamable=true name=mux \
        ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/x/t1bk-v8ap-grgs-c06g app=live2" \
        audiotestsrc \
        ! voaacenc bitrate=128000 \
        ! mux.
