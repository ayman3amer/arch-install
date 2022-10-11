#!/bin/bash

# install dwm
mkdir -vP ~/resources/github/
git clone "https://github.com/ayman3amer/dwm.git" ~/resources/github/dwm
cd ~/resources/github/dwm
sudo make clean install