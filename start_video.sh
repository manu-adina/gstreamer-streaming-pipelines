#!/bin/bash

gst-launch-1.0 tcambin ! video/x-raw, width=1280, height=720 ! videoconvert ! v4l2h264enc ! rtph264pay ! udpsink host=127.0.0.1 port=5801
