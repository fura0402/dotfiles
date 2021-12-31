#!/bin/bash

if [ -z $darwinDir ]; then
    system_preferencesDir=$(\cd $(dirname $0); pwd)
    system_configDir="$system_preferencesDir/system_conf"
else
    system_configDir="$darwinDir/modules/system_preferences/system_conf"
fi

###############################################################################
# Core System Preferences ( Finder, Power )                                   #
###############################################################################

. "$system_configDir/finder.sh"
#. "$system_configDir/power.sh"


###############################################################################
# System Preferences ( General, Dock, MenuBar, MissionControl, Sound,         #
#                                      Keyboard, Shortcut, Trackpad, Mouse )  #
###############################################################################

#. "$system_configDir/general.sh"
. "$system_configDir/dock.sh"
. "$system_configDir/menu_bar.sh"
. "$system_configDir/mission_control.sh"
#. "$system_configDir/accessibility.sh"
. "$system_configDir/sound.sh"
. "$system_configDir/keyboard.sh"
. "$system_configDir/shortcut.sh"
#. "$system_configDir/trackpad.sh"
#. "$system_configDir/mouse.sh"


###############################################################################
# Ohter                                                                       #
###############################################################################

# 常に verbose mode で起動
sudo nvram boot-args="-v"
# バックライトの輝度
sudo nvram backlight-level=%94%01

### Screenshots ###
# スクリーンショットの保存場所
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location -string ~/Screenshots


for app in "Finder" "Dock" "SystemUIServer"; do
    killall "${app}"
done
