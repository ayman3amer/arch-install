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

chsh -s $(which zsh)
