#!/bin/bash
###############################################################################
# Mission Control                                                             #
###############################################################################

# 最新の使用状況の基づいて操作スペースを自動的に並べ替える
defaults write com.apple.dock mru-spaces -bool 0

# アプリケーションの切り替えで、アプリケーションのウインドウが開いている操作スペースに移動
defaults write -g AppleSpacesSwitchOnActivate -bool false

# ウインドウをアプリケーションごとにグループ化
defaults write com.apple.dock expose-group-apps -bool false

# ディスプレイごとに個別の操作スペース
defaults write com.apple.spaces spans-displays -bool true
