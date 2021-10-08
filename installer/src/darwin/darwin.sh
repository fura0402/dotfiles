#!/bin/bash

CURRENT_SOURCE=${BASH_SOURCE[$(expr ${#BASH_SOURCE[@]} - 1)]##*/}
if [ "$CURRENT_SOURCE" != "installer.sh" ];then
    echo " Warning!"
    echo " This script cannot be run by itself."
    echo " You need to run it from 'installer.sh'"
    exit 1
fi


itemsList=('Full Install' 'Editor Install' 'Custom Install')
itemsNum=${#itemsList[@]}

currentOS=$(sw_vers -productName)

. "$sourceDir/menu.sh"

case $cursor in
    "0")
        . "$darwinDir/items_list/full_install/full_install.sh"
        ;;
    "1")
        . "$darwinDir/items_list/editor_install/editor_install.sh"
        ;;
    "-1")
        . "$darwinDir/items_list/custom_install/custom_install.sh"
        ;;
    *)
        echo "A fatal error has occurred."
        echo "cursorNum: $cursor"
        exit 1
esac
