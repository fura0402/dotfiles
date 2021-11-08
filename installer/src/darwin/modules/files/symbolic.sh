#!/bin/bash

if [ -z $dotfilesDir ]; then
    currentDir=$(\cd $(dirname $0); pwd)
    dotfilesDir=${currentDir%%/dotfiles*}/dotfiles
fi

echo $dotfilesDir
echo 'Paste the Symbolic link...'
for file in $dotfilesDir/.??*; do
    [ "$file" = "$dotfilesDir/CNAME" ] && continue
    [ "$file" = "$dotfilesDir/.config" ] && continue
    [ "$file" = "$dotfilesDir/.git" ] && continue
    [ "$file" = "$dotfilesDir/.gitignore" ] && continue
    [ "$file" = "$dotfilesDir/.tmux.conf.osx" ] && continue

    ln -snfv $file ~
done

ln -snfv $dotfilesDir/.config/* ~/.config

echo 'Complete!!'
