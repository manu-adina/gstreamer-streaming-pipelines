#!/bin/bash

gst-launch-1.0 udpsrc port=5801 ! application/x-rtp, payload=96, encoding-name=H264, clock-rate=90000 ! rtpjitterbuffer latency=50 ! rtph264depay ! h264parse ! v4l2h264dec ! glimagesink sync=false
