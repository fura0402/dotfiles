#!/bin/bash

binutils_flag=0
if [ -d /usr/local/opt/binutils ]; then
    if brew list binutils &>/dev/null; then
        brew uninstall binutils
        binutils_flag=1
    else
        printf '\e[33;1;4m%s\e[m\n' 'Uninstall binutils once.'
        exit 1
    fi
fi

if ! which anyenv &>/dev/null; then
    echo ""
    echo "Homebrew is not installed."
    echo "It will be installed automatically."
    brew install anyenv && anyenv install --init
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi

anyenv install --update
if ! anyenv update 2>/dev/null; then
    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
    anyenv update
fi


if ! which pyenv; then anyenv install pyenv; fi
if ! which nodenv; then anyenv install nodenv; fi
if ! which rbenv; then anyenv install rbenv; fi

if ! which fd; then brew install fd; fi
if ! which rg; then brew install rg; fi

# pyenv
pyenv install --skip-existing 3.9.7
pyenv global 3.9.7

pip install virtualenv
virtualenv -p python3 $HOME/nvim-python3

source $HOME/nvim-python3/bin/activate
pip install --upgrade pip
pip install pynvim
pip install cmake-language-server
deactivate
pyenv global system


# nodenv
nodenv install --skip-existing 16.13.1
nodenv global 16.13.1

npm install -g neovim

npm i -g bash-language-server
npm i -g vscode-langservers-extracted
npm i -g dockerfile-language-server-nodejs
npm i -g emmet-ls
npm i -g pyright
npm i -g vim-language-server
npm i -g typescript typescript-language-server
npm i -g vscode-langservers-extracted

npm i -g yarn
yarn global add yaml-language-server
nodenv global system


# rbenv
rbenv install --skip-existing 3.0.2
rbenv global 3.0.2
gem install neovim
rbenv global system


# go
if ! which go; then brew install go; fi
GO111MODULE=on go install golang.org/x/tools/gopls@latest


# brew
if ! brew list binutils &>/dev/null; then brew install binutils; fi
if ! which rust-analyzer; then brew install rust-analyzer; fi


# scripts
#sumneko_lua
brew install ninja
dir="${HOME}/.local/share/nvim/lsp_servers"
mkdir -p "$dir"
\cd "$dir"
git clone https://github.com/sumneko/lua-language-server
\cd lua-language-server
git submodule update --init --recursive
\cd 3rd/luamake
compile/install.sh
\cd ../..
./3rd/luamake/luamake rebuild


#lemminx: (https://download.jboss.org/jbosstools/vscode/stable/lemminx-binary/0.18.0-400/)
dir="${HOME}/.local/share/nvim/lsp_servers/lemminx"
mkdir -p "$dir"
\cd "$dir"
curl -O https://download.jboss.org/jbosstools/vscode/stable/lemminx-binary/0.18.0-400/lemminx-osx-x86_64.zip
unzip lemminx-osx-x86_64.zip
\rm -f lemminx-osx-x86_64.zip


if [ $binutils_flag -eq 1 ]; then
    brew install binutils
fi
