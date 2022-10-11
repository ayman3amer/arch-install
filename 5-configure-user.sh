#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi

# xdg user dirs
xdg-user-dirs-update


# enable mpd services
systemctl --user enable mpd.service
systemctl --user enable mpDris2.service

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# change shell to zsh
chsh -s $(which zsh)

git config --global user.name "ayman"
git config --global user.email "ayman.3amer96@gmail.com"

# deploy dotfiles
mkdir -vP ~/resources/github/
git clone "https://github.com/ayman3amer/dotfiles.git" ~/resources/github/dotfiles
cd ~/resources/github/dotfiles
stow -vt ~ */

