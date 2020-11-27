#!/bin/bash
clear -x

installerDir="$(\cd $(dirname "$0"); pwd)"
dotfilesDir=${installerDir%%/dotfiles*}/dotfiles
sourceDir="$installerDir/src"

currentKernel=$(uname -s)
case $currentKernel in
    "Darwin")
        darwinDir="$sourceDir/darwin"
        . "$darwinDir/darwin.sh"
        ;;
    "Linux")
        linuxDir="$sourceDir/linux"
        . "$linuxDir/linux.sh"
        ;;
    *)
        echo -e "\nThis operating system is not supported."
        echo -e "\nRun 'uname -a': $(uname -a)\n"
        ;;
esac
