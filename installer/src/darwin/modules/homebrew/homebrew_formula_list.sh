#!/bin/bash

homebrew_formula_list=1

# Full Install
full_install_flag=0

####################################################
# Brew                                             #
####################################################
         bash_select=0
          git_select=0
         fish_select=0
     starship_select=0
       neovim_select=0
         yarn_select=0
          vim_select=0
         tmux_select=0
sfmono_square_select=0
          gcc_select=0
         llvm_select=0
        cmake_select=0
           go_select=0
         gtk3_select=0
         sdl2_select=0
        spark_select=0
       anyenv_select=0
          hub_select=0
         nasm_select=0
      ncurses_select=0
         qemu_select=0
         ruby_select=0
     binutils_select=0
          bat_select=0
         curl_select=0
       direnv_select=0
          exa_select=0
         tldr_select=0
        trash_select=0
         tree_select=0
          fzf_select=0
          gdb_select=0
        hexyl_select=0
          tig_select=0
      lazygit_select=0
         htop_select=0
     neofetch_select=0
          duf_select=0
        procs_select=0
      cmatrix_select=0
      nyancat_select=0
      silicon_select=0

select_brewformula=('bash' 'git' 'fish' 'starship' 'neovim' 'yarn' 'vim' 'tmux'
                    'sfmono-square' 'gcc' 'llvm' 'cmake' 'go' 'gtk+3' 'sdl2' 'spark' 'anyenv' 'hub' 'nasm' 'ncurses' 'qemu' 'ruby'
                    'binutils' 'bat' 'curl' 'direnv' 'exa' 'tldr' 'trash' 'tree'
                    'fzf' 'gdb' 'hexyl' 'tig' 'lazygit'
                    'htop' 'neofetch' 'duf' 'procs'
                    'cmatrix' 'nyancat' 'silicon'
)


####################################################
# Cask                                             #
####################################################
            discord_select=0
             zoomus_select=0
             docker_select=0
             ghidra_select=0
          gitkraken_select=0
             iterm2_select=0
          unity_hub_select=0
         virtualbox_select=0
 visual_studio_code_select=0
          wireshark_select=0
            xquartz_select=0
 autodesk_fusion360_select=0
            blender_select=0
              clipy_select=0
 karabiner_elements_select=0
              deepl_select=0
             notion_select=0
                obs_select=0
            firefox_select=0
      google_chrome_select=0
google_japanese_ime_select=0
font_hack_nerd_font_select=0

select_caskformula=('Discord' 'Zoomus'
                    'Docker' 'Ghidra' 'Gitkraken' 'iTerm2' 'Unity-Hub' 'VirtualBox' 'Visual-Studio-Code' 'Wireshark' 'Xquartz'
                    'Autodesk-Fusion360' 'Blender' 'Clipy' 'Karabiner-Elements' 'Deepl' 'Notion' 'OBS'
                    'Firefox' 'Google-Chrome' 'Google-japanese-ime'
                    'Font-hack-nerd-font'
)

####################################################
# Mas                                              #
####################################################
mas_select=0

line_select=0
slack_select=0
tweetdeck_select=0
twitter_select=0
coteditor_select=0
developer_select=0
amphetamine_select=0
bettersnaptool_select=0
glview_select=0
keynote_select=0
skitch_select=0
theunarchiver_select=0
winarchiverlite_select=0
xmind_select=0
xcode_select=0
cinebench_select=0

select_masformula=('LINE' 'Slack' 'TweetDeck' 'Twitter'
                   'CotEditor' 'Developer' 'Amphetamine'
                   'BetterSnapTool' 'GLView' 'Keynote' 'Skitch' 'TheUnarchiver' 'WinArchiverLite' 'XMind' 'Xcode' 'Cinebench'
)


### Debug ##
#echo "Brew: ${#select_brewformula[@]}"
#for brew in "${select_brewformula[@]}"; do
#    echo $brew
#done
#echo
#echo "Cack: ${#select_caskformula[@]}"
#for cask in "${select_caskformula[@]}"; do
#    echo $cask
#done
#echo
#echo "Mas: ${#select_masformula[@]}"
#for mas in "${select_masformula[@]}"; do
#    echo $mas
#done
