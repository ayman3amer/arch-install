#!/bin/bash

# install dwm
mkdir -vP ~/resources/github/
git clone "https://github.com/ayman3amer/dwm.git" ~/resources/github/dwm
cp /home/ayman/resources/github/dotfiles/dwm/.local/share/dwm/config.h ~/resources/github/dwm/
cd ~/resources/github/dwm
sudo make clean install

# install dwmblocks
git clone https://github.com/torrinfail/dwmblocks.git ~/resources/dwmblocks
cp /home/ayman/resources/github/dotfiles/dwm/.local/share/dwm/blocks.h ~/resources/dwmblocks/
sudo make clean install

