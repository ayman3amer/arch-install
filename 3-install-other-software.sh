#!/bin/bash

## clone repos
mkdir -vP ~/resources/github/
mkdir -vP ~/programs
git clone "https://github.com/ayman3amer/dotfiles.git" ~/resources/github/dotfiles
git clone "https://github.com/ayman3amer/dwm.git" ~/resources/github/dwm
git clone https://github.com/torrinfail/dwmblocks.git ~/programs/dwmblocks

# install dwm
cp /home/ayman/resources/github/dotfiles/dwm/.local/share/dwm/config.h ~/resources/github/dwm/
cd ~/resources/github/dwm
sudo make clean install

# install dwmblocks

cp /home/ayman/resources/github/dotfiles/dwm/.local/share/dwm/blocks.h ~/programs/dwmblocks/
cd ~/programs/dwmblocks
sudo make clean install

# urxvt bidi (update versoin number) (MAKE script to do THAT)
cd ~/programs
wget https://cpan.metacpan.org/authors/id/K/KA/KAMENSKY/Text-Bidi-2.18.tar.gz
tar -xf https://cpan.metacpan.org/authors/id/K/KA/KAMENSKY/Text-Bidi-2.18.tar.gz
sudo cp Text-Bidi-2.18/misc/bidi /usr/lib/urxvt/perl/

# brave extention


# install vscode extentions
cat vscode.txt | xargs -L 1 code --install-extension
