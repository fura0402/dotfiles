#!/bin/bash
###############################################################################
# Sound                                                                       #
###############################################################################


# 起動音を再生しない( %00で再生 )
sudo nvram StartupMute=%01

# Volume
osascript -e "set volume 10/100*7"

# Mute
osascript -e 'set volume with output muted'
