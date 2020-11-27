#!/bin/bash

if [ -z $dotfilesDir ]; then
    currentDir=$(\cd $(dirname $0); pwd)
    dotfilesDir=${currentDir%%/dotfiles*}/dotfiles
fi

echo $dotfilesDir
echo 'Paste the Symbolic link...'
for file in $dotfilesDir/.??*; do
    [ "$file" = "$dotfilesDir/.git" ] && continue
    [ "$file" = "$dotfilesDir/.gitignore" ] && continue
    [ "$file" = "$dotfilesDir/.config" ] && continue

    ln -snfv $file ~
done

ln -snfv $dotfilesDir/.config/bat ~/.config
ln -snfv $dotfilesDir/.config/karabiner/karabiner.json ~/.config/karabiner
ln -snfv $dotfilesDir/.config/nvim ~/.config
ln -snfv $dotfilesDir/.config/starship.toml ~/.config

echo 'Complete!!'
