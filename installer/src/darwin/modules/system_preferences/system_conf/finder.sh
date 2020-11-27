#!/bin/bash
###############################################################################
# Finder                                                                      #
###############################################################################


# Finderに終了オプションを追加
defaults write com.apple.finder QuitMenuItem -bool true

# 隠しファイルを表示
defaults write com.apple.Finder AppleShowAllFiles -bool true

# ファイルの保存場所をiCloud以外に設定
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# ロールオーバー遅延
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float "0.0"

# サイドバーのアイコンサイズを変更
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# パスバーの表示
defaults write com.apple.finder ShowPathbar -bool true

# usbやネットワークストレージに.ds_storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# General #
# デスクトップに表示する項目（ハードディスク）
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# デスクトップに表示する項目（外部ディスク）
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# デスクトップに表示する項目（CD, DVD, およびiPad）
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# デスクトップに表示する項目（接続中のサーバ）
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# 新規Finderウィンドウで次を表示:
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# フォルダを新規ウィンドウではなくタブで開く
defaults write com.apple.finder FinderSpawnTab -bool false


# Detail #
# すべてのファイル名拡張子を表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# 拡張子を変更する前に警告を表示
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true

# iCloud Driveから削除する前に警告を表示
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool true

# 30日後にゴミ箱から項目を削除
defaults write com.apple.finder FXRemoveOldTrashItems -bool false
# フォルダを常に先頭に表示する場所（名前順で表示しているウィンドウ）
defaults write com.apple.finder _FXSortFoldersFirst -bool false

# フォルダを常に先頭に表示する場所（デスクトップ）
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool false

# 検索実行時（このMacを検索）
defaults write com.apple.finder FXDefaultSearchScope -string "SCev"
