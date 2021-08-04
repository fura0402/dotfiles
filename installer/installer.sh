#!/bin/bash

clear -x

currentKernel=$(uname -s)
currentOS=""
case $currentKernel in
    "Darwin")
        . ./src/darwin/darwin.sh
        ;;
    "Linux")
        . ./src/linux/linux.sh
        ;;
    *)
        echo -e "\nThis operating system is not supported."
        echo -e "\nRun 'uname -a': $(uname -a)\n"
        ;;
esac
