#!/bin/bash


gst-launch-1.0 videotestsrc is-live=true ! x264enc ! mpegtsmux ! hlssink
