#!/bin/bash

function setup_brew(){
    echo 'install CommandLineTool...'
    xcode-select --install
    echo 'installed CommandLineTool'

    echo 'install Homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'installed Homebrew'

    echo "Run brew doctor..."
    brew doctor
    echo "OK, Run brew update..."
    brew update
    echo "OK, Run brew upgrade..."
    brew upgrade

    echo "brew tap..."
    brew tap homebrew/core
    brew tap homebrew/cask
    brew tap homebrew/cask-fonts
    #brew tap homebrew/bundle
    echo "brew tapped"

    brew cleanup

    echo 'Complete!!'
}

if which brew &>/dev/null; then
    echo "Homebrew is already installed."
else
    setup_brew
fi
