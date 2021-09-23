#!/bin/bash
###############################################################################
# KeyBoard                                                                    #
###############################################################################


# 自動変換
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# キーのリピート
defaults write NSGlobalDomain KeyRepeat -int 2

# リピート入力認識までの時間
defaults write NSGlobalDomain InitialKeyRepeat -int 15
