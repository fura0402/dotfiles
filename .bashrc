prompt_check
trap prompt_check SIGWINCH

### alias ###
function all_alias(){
    alias cd='cdls'
    alias ..='cd ..'
    alias dot='cd ~/dotfiles'

    alias ls='ls_notice'
    if type -a \exa &>/dev/null; then
        alias la='ls -al'
        alias tree='exa --icons --tree --ignore-glob=".git"'
        alias l1='ls -1'
    else
        alias la='ls -Al'
    fi
    alias ll='ls -l'
    alias less='less -R'
    alias cat='bat'

    alias n='nvim'
    alias j='zls'
    alias lg='lazygit'

    # brew
    alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew'

    # tmux
    alias t='tmux -u'
    alias ta='tmux attach'
    alias tat='tmux attach -t'
    alias tl='tmux ls'

    ## ide
    #alias ide='~/dotfiles/scripts/ide'

    # silicon
    alias silicon='silicon --shadow-blur-radius 15 --background "#5550" --font "Ricty"'

    # Ghidra
    alias ghidra='open /Applications/ghidra_9.1.1_PUBLIC/ghidraRun'

    # C/C++
    #alias gcc='gcc-11'
    #alias g++='g++-11'

    # GDB
    #alias gdb='sudo /usr/local/bin/gdb'

    # nvim lsp with lua
    #alias luamake='~/.local/share/nvim/lsp_servers/lua-language-server/3rd/luamake/luamake'

    # trash
    if type trash &> /dev/null; then
        alias rm='trash'
    fi
}
all_alias

#############

# z command
source /usr/local/etc/profile.d/z.sh
unalias z

# hub
#eval "$(hub alias -s)"

# done (original)
#/usr/bin/osascript -e 'display notification "hogehoge" with title "iTerm" subtitle "done." sound name "Submarine"'
