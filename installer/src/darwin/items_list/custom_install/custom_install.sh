#!/bin/bash

CURRENT_SOURCE=${BASH_SOURCE[$(expr ${#BASH_SOURCE[@]} - 1)]##*/}
if [ "$CURRENT_SOURCE" != "installer.sh" ];then
    echo " Warning!"
    echo " This script cannot be run by itself."
    echo " You need to run it from 'installer.sh'"
    exit 1
fi


echo "cursorNum:"$cursor
echo "Custom Install"
printf '\e[33;1;4m%s\e[m\n' 'Under Construction.'
#. "custom_menu.sh"
