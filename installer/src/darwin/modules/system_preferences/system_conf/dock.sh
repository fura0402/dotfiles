#!/bin/bash
###############################################################################
# Dock                                                                        #
###############################################################################


# すべてのアプリをDockから削除
defaults write com.apple.dock persistent-apps -array

# 起動しているアプリのみを表示
defaults write com.apple.dock static-only -bool true

# 起動しているアプリにインジケータライトを表示する
defaults write com.apple.dock show-process-indicators -bool true

# アイコンサイズを変更
defaults write com.apple.dock tilesize -int 14

# 自動非表示
defaults write com.apple.dock autohide -bool true

# 自動表示の遅延
defaults write com.apple.dock autohide-delay -float "0.0"

# アニメーション効果
defaults write com.apple.dock mineffect -string scale

# アニメーション時間
defaults write com.apple.dock autohide-time-modifier -float "1.0"

# 最近のアプリを非表示
defaults write com.apple.dock show-recents -bool false

# フォーカスした際の拡大設定
defaults write com.apple.dock magnification -bool true

# 拡大率
defaults write com.apple.dock largesize -int 128
