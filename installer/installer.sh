#!/bin/bash

clear -x

installerDir=$HOME/dotfiles/installer
sourceDir=$installerDir/src

currentKernel=$(uname -s)
currentOS=""
case $currentKernel in
    "Darwin")
        darwinDir=$sourceDir/darwin
        . $darwinDir/darwin.sh
        ;;
    "Linux")
        linuxDir=$sourceDir/linux
        . $linuxDir/linux.sh
        ;;
    *)
        echo -e "\nThis operating system is not supported."
        echo -e "\nRun 'uname -a': $(uname -a)\n"
        ;;
esac
