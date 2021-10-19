#!/bin/bash

CURRENT_SOURCE=${BASH_SOURCE[$(expr ${#BASH_SOURCE[@]} - 1)]##*/}
if [ "$CURRENT_SOURCE" != "installer.sh" ];then
    echo " Warning!"
    echo " This script cannot be run by itself."
    echo " You need to run it from 'installer.sh'"
    exit 1
fi


echo "Editor Install.."
echo ""


. $darwinDir/modules/homebrew/homebrew_installer.sh

brew install neovim
brew install vim
brew install tmux
. $darwinDir/modules/homebrew/homebrew_formula_full_install.sh

echo 'Paste the Symbolic link...'
ln -snfv $dotfilesDir/.config/nvim ~/.config
ln -snfv $dotfilesDir/.vimrc ~
ln -snfv $dotfilesDir/.tmux.conf ~
