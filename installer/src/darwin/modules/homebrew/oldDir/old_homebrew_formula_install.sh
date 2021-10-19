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

if [ -z $homebrew_formula_list ]; then
    echo " Error: 'homebrew_formula_list' is not loaded."
    exit 1
fi


####################################################
# Brew                                             #
####################################################
if [ $full_install_flag -eq 1 ]; then
    brew install bash
elif [ $bash_select -eq 1 ]; then
    brew install bash
fi

if [ $full_install_flag -eq 1 ]; then
    brew install git
elif [ $git_select -eq 1 ]; then
    brew install git
fi

if [ $full_install_flag -eq 1 ]; then
    brew install fish
elif [ $fish_select -eq 1 ]; then
    brew install fish
fi

if [ $full_install_flag -eq 1 ]; then
    brew install starship
elif [ $starship_select -eq 1 ]; then
    brew install starship
fi

if [ $full_install_flag -eq 1 ]; then
    brew install neovim
elif [ $neovim_select -eq 1 ]; then
    brew install neovim
fi

if [ $full_install_flag -eq 1 ]; then
    brew install yarn
elif [ $yarn_select -eq 1 ]; then
    brew install yarn
fi

if [ $full_install_flag -eq 1 ]; then
    brew install vim
elif [ $vim_select -eq 1 ]; then
    brew install vim
fi

if [ $full_install_flag -eq 1 ]; then
    brew install tmux
elif [ $tmux_select -eq 1 ]; then
    brew install tmux
fi

if [ $full_install_flag -eq 1 ]; then
    brew tap delphinus/sfmono-square
    brew install sfmono-square
    #brew install delphinus/sfmono-square/sfmono-square
elif [ $sfmono_square_select -eq 1 ]; then
    brew tap delphinus/sfmono-square
    brew install sfmono-square
    #brew install delphinus/sfmono-square/sfmono-square
fi

if [ $full_install_flag -eq 1 ]; then
    brew install gcc
elif [ $gcc_select -eq 1 ]; then
    brew install gcc
fi

if [ $full_install_flag -eq 1 ]; then
    brew install llvm
elif [ $llvm_select -eq 1 ]; then
    brew install llvm
fi

if [ $full_install_flag -eq 1 ]; then
    brew install cmake
elif [ $cmake_select -eq 1 ]; then
    brew install cmake
fi

if [ $full_install_flag -eq 1 ]; then
    brew install go
elif [ $go_select -eq 1 ]; then
    brew install go
fi

if [ $full_install_flag -eq 1 ]; then
    brew install gtk+3
elif [ $gtk3_select -eq 1 ]; then
    brew install gtk+3
fi

if [ $full_install_flag -eq 1 ]; then
    brew install sdl2
elif [ $sdl2_select -eq 1 ]; then
    brew install sdl2
fi

if [ $full_install_flag -eq 1 ]; then
    brew install spark
elif [ $spark_select -eq 1 ]; then
    brew install spark
fi

if [ $full_install_flag -eq 1 ]; then
    brew install anyenv
elif [ $anyenv_select -eq 1 ]; then
    brew install anyenv
fi

if [ $full_install_flag -eq 1 ]; then
    brew install hub
elif [ $hub_select -eq 1 ]; then
    brew install hub
fi

if [ $full_install_flag -eq 1 ]; then
    brew install nasm
elif [ $nasm_select -eq 1 ]; then
    brew install nasm
fi

if [ $full_install_flag -eq 1 ]; then
    brew install ncurses
elif [ $ncurses_select -eq 1 ]; then
    brew install ncurses
fi

if [ $full_install_flag -eq 1 ]; then
    brew install qemu
elif [ $qemu_select -eq 1 ]; then
    brew install qemu
fi

if [ $full_install_flag -eq 1 ]; then
    brew install ruby
elif [ $ruby_select -eq 1 ]; then
    brew install ruby
fi

if [ $full_install_flag -eq 1 ]; then
    brew install binutils
elif [ $binutils_select -eq 1 ]; then
    brew install binutils
fi

if [ $full_install_flag -eq 1 ]; then
    brew install bat
elif [ $bat_select -eq 1 ]; then
    brew install bat
fi

if [ $full_install_flag -eq 1 ]; then
    brew install curl
elif [ $curl_select -eq 1 ]; then
    brew install curl
fi

if [ $full_install_flag -eq 1 ]; then
    brew install direnv
elif [ $direnv_select -eq 1 ]; then
    brew install direnv
fi

if [ $full_install_flag -eq 1 ]; then
    brew install exa
elif [ $exa_select -eq 1 ]; then
    brew install exa
fi

if [ $full_install_flag -eq 1 ]; then
    brew install tldr
elif [ $tldr_select -eq 1 ]; then
    brew install tldr
fi

if [ $full_install_flag -eq 1 ]; then
    brew install trash
elif [ $trash_select -eq 1 ]; then
    brew install trash
fi

if [ $full_install_flag -eq 1 ]; then
    brew install tree
elif [ $tree_select -eq 1 ]; then
    brew install tree
fi

if [ $full_install_flag -eq 1 ]; then
    brew install fzf
elif [ $fzf_select -eq 1 ]; then
    brew install fzf
fi

if [ $full_install_flag -eq 1 ]; then
    brew install gdb
elif [ $gdb_select -eq 1 ]; then
    brew install gdb
fi

if [ $full_install_flag -eq 1 ]; then
    brew install hexyl
elif [ $hexyl_select -eq 1 ]; then
    brew install hexyl
fi

if [ $full_install_flag -eq 1 ]; then
    brew install tig
elif [ $tig_select -eq 1 ]; then
    brew install tig
fi

if [ $full_install_flag -eq 1 ]; then
    brew tap jesseduffield/lazygit
    brew install jesseduffield/lazygit/lazygit
elif [ $lazygit_select -eq 1 ]; then
    brew tap jesseduffield/lazygit
    brew install jesseduffield/lazygit/lazygit
fi

if [ $full_install_flag -eq 1 ]; then
    brew install htop
elif [ $htop_select -eq 1 ]; then
    brew install htop
fi

if [ $full_install_flag -eq 1 ]; then
    brew install neofetch
elif [ $neofetch_select -eq 1 ]; then
    brew install neofetch
fi

if [ $full_install_flag -eq 1 ]; then
    brew install duf
elif [ $duf_select -eq 1 ]; then
    brew install duf
fi

if [ $full_install_flag -eq 1 ]; then
    brew install procs
elif [ $procs_select -eq 1 ]; then
    brew install procs
fi

if [ $full_install_flag -eq 1 ]; then
    brew install cmatrix
elif [ $cmatrix_select -eq 1 ]; then
    brew install cmatrix
fi

if [ $full_install_flag -eq 1 ]; then
    brew install nyancat
elif [ $nyancat_select -eq 1 ]; then
    brew install nyancat
fi

if [ $full_install_flag -eq 1 ]; then
    brew install silicon
elif [ $silicon_select -eq 1 ]; then
    brew install silicon
fi


####################################################
# Cask                                             #
####################################################
if [ $full_install_flag -eq 1 ]; then
    brew install --cask discord
elif [ $discord_select -eq 1 ]; then
    brew install --cask discord
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask zoomus
elif [ $zoomus_select -eq 1 ]; then
    brew install --cask zoomus
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask docker
elif [ $docker_select -eq 1 ]; then
    brew install --cask docker
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask ghidra
elif [ $ghidra_select -eq 1 ]; then
    brew install --cask ghidra
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask iterm2
elif [ $iterm2_select -eq 1 ]; then
    brew install --cask iterm2
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask unity-hub
elif [ $unity_hub_select -eq 1 ]; then
    brew install --cask unity-hub
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask virtualbox
elif [ $virtualbox_select -eq 1 ]; then
    brew install --cask virtualbox
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask visual-studio-code
elif [ $visual_studio_code_select -eq 1 ]; then
    brew install --cask visual-studio-code
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask wireshark
elif [ $wireshark_select -eq 1 ]; then
    brew install --cask wireshark
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask xquartz
elif [ $xquartz_select -eq 1 ]; then
    brew install --cask xquartz
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask autodesk-fusion360
elif [ $autodesk_fusion360_select -eq 1 ]; then
    brew install --cask autodesk-fusion360
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask blender
elif [ $blender_select -eq 1 ]; then
    brew install --cask blender
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask clipy
elif [ $clipy_select -eq 1 ]; then
    brew install --cask clipy
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask karabiner-elements
elif [ $karabiner_elements_select -eq 1 ]; then
    brew install --cask karabiner-elements
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask deepl
elif [ $deepl_select -eq 1 ]; then
    brew install --cask deepl
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask notion
elif [ $notion_select -eq 1 ]; then
    brew install --cask notion
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask obs
elif [ $obs_select -eq 1 ]; then
    brew install --cask obs
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask firefox
elif [ $firefox_select -eq 1 ]; then
    brew install --cask firefox
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask google-chrome
elif [ $google_chrome_select -eq 1 ]; then
    brew install --cask google-chrome
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask google-japanese-ime
elif [ $google_japanese_ime_select -eq 1 ]; then
    brew install --cask google-japanese-ime
fi

if [ $full_install_flag -eq 1 ]; then
    brew install --cask font-hack-nerd-font
elif [ $font_hack_nerd_font_select -eq 1 ]; then
    brew install --cask font-hack-nerd-font
fi


####################################################
# Mas                                              #
####################################################
if [ $full_install_flag -eq 1 ]; then
    brew install mas
elif [ $mas_select -eq 1 ]; then
    brew install mas
fi

if [ $full_install_flag -eq 1 -o $mas_select -eq 1 ]; then
    if [ $full_install_flag -eq 1 ]; then
        mas install 539883307	#LINE
    elif [ $line_select -eq 1 ]; then
        mas install 539883307	#LINE
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 803453959	#Slack
    elif [ $slack_select -eq 1 ]; then
        mas install 803453959	#Slack
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 485812721	#TweetDeck
    elif [ $tweetdeck_select -eq 1 ]; then
        mas install 485812721	#TweetDeck
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 1482454543	#Twitter
    elif [ $twitter_select -eq 1 ]; then
        mas install 1482454543	#Twitter
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 1024640650	#CotEditor
    elif [ $coteditor_select -eq 1 ]; then
        mas install 1024640650	#CotEditor
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 640199958	#Developer
    elif [ $developer_select -eq 1 ]; then
        mas install 640199958	#Developer
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 937984704	#Amphetamine
    elif [ $amphetamine_select -eq 1 ]; then
        mas install 937984704	#Amphetamine
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 417375580	#BetterSnapTool
    elif [ $bettersnaptool_select -eq 1 ]; then
        mas install 417375580	#BetterSnapTool
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 444052073	#GLView
    elif [ $glview_select -eq 1 ]; then
        mas install 444052073	#GLView
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 409183694	#Keynote
    elif [ $keynote_select -eq 1 ]; then
        mas install 409183694	#Keynote
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 425955336	#Skitch
    elif [ $skitch_select -eq 1 ]; then
        mas install 425955336	#Skitch
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 425424353	#The Unarchiver
    elif [ $theunarchiver_select -eq 1 ]; then
        mas install 425424353	#The Unarchiver
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 414855915	#WinArchiver Lite
    elif [ $winarchiverlite_select -eq 1 ]; then
        mas install 414855915	#WinArchiver Lite
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 1327661892	#XMind
    elif [ $xmind_select -eq 1 ]; then
        mas install 1327661892	#XMind
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 497799835	#Xcode
    elif [ $xcode_select -eq 1 ]; then
        mas install 497799835	#Xcode
    fi

    if [ $full_install_flag -eq 1 ]; then
        mas install 1438772273	#Cinebench
    elif [ $cinebench_select -eq 1 ]; then
        mas install 1438772273	#Cinebench
    fi
fi
