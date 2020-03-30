#!/bin/sh

gst-launch-1.0 \
        videotestsrc is-live=1 \
        ! videoconvert \
        ! "video/x-raw, width=1280, height=720, framerate=25/1" \
        ! queue \
        ! x264enc bitrate=2000 byte-stream=false key-int-max=60 bframes=0 aud=true tune=zerolatency ! "video/x-h264,profile=main" \
        ! flvmux streamable=true name=mux \
        ! rtmpsink location="rtmp://a.rtmp.youtube.com/live2/x/ue0c-f1p4-er78-cjy8 app=live2" \
        audiotestsrc \
        ! voaacenc bitrate=128000 \
        ! mux.
