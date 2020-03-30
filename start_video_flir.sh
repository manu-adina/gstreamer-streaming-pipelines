#!/bin/bash

gst-launch-1.0 aravissrc ! "video/x-raw, format=GRAY8, width=640, height=480" ! videoconvert ! "video/x-raw, format=RGB" ! v4l2h264enc ! rtph264pay ! udpsink host=127.0.0.1 port=5801
