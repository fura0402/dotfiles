#export PS1="╭─\u@\h:\W \n╰─|ω･)ﾁﾗ ≺"
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    source /usr/local/etc/bash_completion.d/git-completion.bash
fi
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
    export PS1='\e[01;37m\]╭─\[\e[01;32m\]\u@\h\[\e[01;33m\] \w$(__git_ps1) \n\[\e[01;37m\]╰─|ω･)ﾁﾗ ≺\[\e[0m\] '
    export PS2="         \[\e[01;37m\]≺ \[\e[0m\]"
else
    export PS1='\e[01;37m\]╭─\[\e[01;32m\]\u@\h\[\e[01;33m\] \w \n\[\e[01;37m\]╰─|ω･)ﾁﾗ ≺\[\e[0m\] '
    export PS2="         \[\e[01;37m\]≺ \[\e[0m\]"
fi

# FB c6c8d1
# BG 161821

# shell設定
# set -o vi # shellキーバインドをvi風に設定
# bind '"jj": vi-movement-mode' # Escを jj にキーバインド


### alias ###

function all_alias(){
    alias cd='cdls'
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias dot='cd ~/dotfiles'

    alias ls='ls_notice'
    alias ll='ls -l'
    if type -a \exa &>/dev/null; then
        alias la='ls -al'
        alias tree='exa --icons --tree'
    else
        alias la='ls -Al'
    fi
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

    # docker
    alias ownC='docker run --rm -v $HOME/workspace/projects/c-compiler-tutorial/:/c-compiler-tutorial -w /c-compiler-tutorial compilerbook'

    # trash
    if type trash &> /dev/null; then
        alias rm='trash'
    fi
}
all_alias

#############

# z command
source ~/z/z.sh
unalias z

# hub
#eval "$(hub alias -s)"

# done (original)
#/usr/bin/osascript -e 'display notification "hogehoge" with title "iTerm" subtitle "done." sound name "Submarine"'


# wakatime
source ~/bash-wakatime/bash-wakatime.sh
