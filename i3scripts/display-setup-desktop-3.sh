#!/bin/sh
xrandr \
    --output HDMI-1 --mode 1920x1080 --pos    0x0 --rotate normal --primary \
    --output HDMI-2 --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output HDMI-3 --off \
    --output DP-2   --mode 1920x1080 --pos 3840x0 --rotate normal \
    --output DP-1   --off

