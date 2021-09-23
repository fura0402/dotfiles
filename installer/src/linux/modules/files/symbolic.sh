#!/bin/bash

if [ -z $dotfilesDir ]; then
    currentDir=$(\cd $(dirname $0); pwd)
    dotfilesDir=${currentDir%%/dotfiles*}/dotfiles
fi

echo 'Paste the Symbolic link...'
for file in .??*; do
    [ "$file" = ".config" ] && continue
    [ "$file" = ".git" ] && continue
    [ "$file" = ".gitignore" ] && continue
    [ "$file" = ".tmux.conf.osx" ] && continue

    ln -snfv $dotfilesDir/$file ~/
done

ln -snfv $dotfilesDir/.config/nvim/ ~/.config

echo 'Complete!!'
