#!/bin/bash

CURRENT_SOURCE=${BASH_SOURCE[$(expr ${#BASH_SOURCE[@]} - 1)]##*/}
if [ "$CURRENT_SOURCE" != "installer.sh" ];then
    echo " Warning!"
    echo " This script cannot be run by itself."
    echo " You need to run it from 'installer.sh'"
    exit 1
fi


echo "Full Install.."
echo ""


. $darwinDir/modules/system_preferences/system_preferences.sh

. $darwinDir/modules/homebrew/homebrew_installer.sh

. $darwinDir/modules/homebrew/homebrew_formula_full_install.sh

# . $darwinDir/modules/neovim/nvim_construct.sh

. $darwinDir/modules/files/symbolic.sh
