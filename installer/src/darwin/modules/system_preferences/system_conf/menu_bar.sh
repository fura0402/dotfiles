#!/bin/bash
###############################################################################
# Menu Bar                                                                    #
###############################################################################


# バッテリー残量の(%)表記
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# デジタル時計の形式を設定
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MMM d  HH:mm:ss\""

