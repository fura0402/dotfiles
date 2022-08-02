#!/bin/bash

CURRENT_SOURCE=${BASH_SOURCE[$(expr ${#BASH_SOURCE[@]} - 1)]##*/}
if [ "$CURRENT_SOURCE" != "installer.sh" ];then
    echo " Warning!"
    echo " This script cannot be run by itself."
    echo " You need to run it from 'installer.sh'"
    exit 1
fi

if ! which brew &>/dev/null; then
    echo "Homebrew is not installed."
    echo "It will be installed automatically."
    homebrewDir="$(\cd $(dirname "$0"); pwd)"
    . "$homebrewDir/homebrew_installer.sh"
    echo
fi


####################################################
# Brew                                             #
####################################################
    brew install bash
    brew install git
    brew install fish
    brew install starship
    brew install neovim
    brew install yarn
    brew install vim
    brew install tmux
    brew tap delphinus/sfmono-square
    brew install sfmono-square && cp -f /usr/local/opt/sfmono-square/share/fonts/SFMonoSquare-* ~/Library/Fonts/
    #brew install delphinus/sfmono-square/sfmono-square
    brew install gcc
    brew install llvm
    brew install cmake
    brew install go
    brew install gtk+3
    brew install sdl2
    brew install spark
    brew install anyenv && anyenv install --init
    brew install hub
    brew install nasm
    brew install ncurses
    brew install qemu
    brew install ruby
    brew install binutils
    brew install bat
    brew install curl
    brew install direnv
    brew install exa
    brew install fd
    brew install rg
    brew install tldr
    brew install trash
    brew install tree
    brew install fzf && $(brew --prefix)/opt/fzf/install --all --no-update-rc
    brew install gdb
    brew install hexyl
    brew install tig
    brew tap jesseduffield/lazygit
    brew install jesseduffield/lazygit/lazygit
    brew install htop
    brew install neofetch
    brew install duf
    brew install procs
    brew install cmatrix
    brew install nyancat
    brew install silicon


####################################################
# Cask                                             #
####################################################
    brew install --cask discord
    brew install --cask skype
    brew install --cask zoom
    brew install --cask docker
    brew install --cask ghidra
    brew install --cask adobe-creative-cloud
    brew install --cask iterm2
    brew install --cask unity-hub
    #brew install --cask virtualbox
    brew install --cask visual-studio-code
    brew install --cask wireshark
    brew install --cask xquartz
    brew install --cask autodesk-fusion360
    brew install --cask blender
    brew install --cask clipy
    brew install --cask karabiner-elements
    brew install --cask deepl
    brew install --cask typora
    brew install --cask lunar
    brew install --cask balenaetcher
    brew install --cask macs-fan-control
    brew install --cask notion
    brew install --cask obs
    brew install --cask firefox
    brew install --cask google-chrome
    brew install --cask google-japanese-ime
    brew install --cask font-hack-nerd-font


####################################################
# Mas                                              #
####################################################
    brew install mas

    mas install 539883307	#LINE
    mas install 803453959	#Slack
    mas install 485812721	#TweetDeck
    mas install 1482454543	#Twitter
    mas install 634148309   #Logic Pro
    mas install 424389933   #Final Cut Pro
    mas install 434290957   #Motion
    mas install 1024640650	#CotEditor
    mas install 640199958	#Developer
    mas install 937984704	#Amphetamine
    mas install 417375580	#BetterSnapTool
    mas install 414568915   #Key Codes
    mas install 444052073	#GLView
    mas install 425955336	#Skitch
    mas install 425424353	#The Unarchiver
    mas install 1327661892	#XMind
    mas install 497799835	#Xcode
    mas install 1438772273	#Cinebench
    mas install 457622435   #Yoink
