# zsh推奨警告を消す
export BASH_SILENCE_DEPRECATION_WARNING=1

export EDITOR="nvim"

export LANG="ja_JP.UTF-8"
#export LANG="en_US.UTF-8"

# tmux-256color が見つからない場合の対処
## MacPorts(Mac標準)
# $ /opt/local/bin/infocmp -x tmux-256color > ~/tmux-256color.src
#   or
# # Homebrew(brew経由のncurses) <-- 基本こっち
# $ /usr/local/opt/ncurses/bin/infocmp -x tmux-256color > ~/tmux-256color.src
#
# Rewrite the file: pairs#0x10000 or pairs#65536 --> pairs#32767
# run: /usr/bin/tic -x -o $HOME/.local/share/terminfo tmux-256color.src
# export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo


### PATH Variables ###

# Required
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# original scripts
export PATH="$HOME/dotfiles/bin:$PATH"

## risc-v
#export PATH="/usr/local/opt/riscv-gnu-toolchain/bin:$PATH"
## gawk gnu-sed gmp mpfr libmpc isl zlib expat
#export PATH="/usr/local/opt/expat/bin:$PATH"
#export ldflags="-l/usr/local/opt/zlib/lib"
#export cppflags="-i/usr/local/opt/zlib/include"
#export ldflags="-l/usr/local/opt/expat/lib"
#export cppflags="-i/usr/local/opt/expat/include"
##GNU "sed" has been installed as "gsed".
##If you need to use it as "sed", you can add a "gnubin" directory
##to your PATH from your bashrc like:
#export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
# rust sdl
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# nodeJS
export PATH="/usr/local/opt/node@18/bin:$PATH"

# go
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"
export GO111MODULE=on

# ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/3.1.0/bin/:$PATH"

# binutils
export PATH="/usr/local/opt/binutils/bin:$PATH"

# llvm
# export PATH="/usr/local/opt/llvm/bin:$PATH"

# java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# openSSL@1.1
export PATH="/usr/local/opt/openssl/bin:$PATH"

# 重複したPATHを消す
export PATH=$(echo "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

######################


### Environment Variables or Read ###

# java ;xml LSP のため
export JAVA_HOME=`/usr/libexec/java_home`

# bat
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#export FZF_DEFAULT_COMMAND=''
export FZF_DEFAULT_OPTS='--height 60% --reverse --border'

#export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob="!{.git,node_modules}/*" 2>/dev/null'
export FZF_CTRL_T_COMMAND='fd --type=file --hidden --follow --no-ignore --strip-cwd-prefix --exclude=.git --exclude=node_modules'
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'

export FZF_ALT_C_COMMAND="fd --type=directory --no-ignore-vcs --strip-cwd-prefix --exclude=.git --exclude=node_modules"
if type -a \exa &>/dev/null; then
    export FZF_ALT_C_OPTS="--preview 'exa --icons --tree {} | head -200'"
else
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi

# zoxide
eval "$(zoxide init --no-cmd bash)"

# hub
#eval "$(hub alias -s)"

#############################


if [ -f ~/.bashrc ] && [ -f ~/.bash_libs ] ; then
    . ~/.bash_libs
    . ~/.bashrc
fi
if [ -f ~/.bash_libs.private ]; then
    . ~/.bash_libs.private
fi
