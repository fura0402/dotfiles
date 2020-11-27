#!/bin/bash

CURRENT_SOURCE=${BASH_SOURCE[$(expr ${#BASH_SOURCE[@]} - 1)]##*/}
if [ "$CURRENT_SOURCE" != "installer.sh" ];then
    echo " Warning!"
    echo " This script cannot be run by itself."
    echo " You need to run it from 'installer.sh'"
    exit 1
fi


itemsList=('Full Install')
itemsNum=${#itemsList[@]}

if [ -e /etc/debian_version ]; then
    currentOS="Debian"
elif [ -e /etc/lsb-release ]; then
    currentOS="Ubuntu"
elif [ -e /etc/fedora-release ]; then
    currentOS="Fedora"
fi

#. ./src/menu.sh
#echo "cursorNum:"$cursor

printf '\e[33;1;4m%s\e[m\n' 'Under Construction.'
