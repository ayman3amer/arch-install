#!/bin/bash

if [ "$EUID" -eq 0 ]
    then echo "do not run as root"
        exit
fi
# xdg user dirs
xdg-user-dirs-update

# copy dotfiles
mkdir -p \
  ${HOME}/.config/alacritty \
  ${HOME}/.config/htop \
  ${HOME}/.config/picom \
  ${HOME}/.config/mpd \
  ${HOME}/.config/ncmpcpp \
  ${HOME}/.config/shell \
  ${HOME}/.config/sxhkd \
  ${HOME}/.config/bspwm \
  ${HOME}/.config/dunst \
  ${HOME}/.config/polybar \
  ${HOME}/.config/rofi \


cp -fvr \
  ./dotfiles/.vimrc \
  ./dotfiles/.xprofile \
  ./dotfiles/.bashrc \
  ./dotfiles/.zshrc \
  ./dotfiles/.xinitrc \
  ./dotfiles/.Xresources \
  ${HOME}/

cp -vr ./dotfiles/.config/alacritty/alacritty.yml ${HOME}/.config/alacritty/
cp -vr ./dotfiles/.config/htop/htoprc ${HOME}/.config/htop/
cp -vr ./dotfiles/.config/mpd/mpd.conf ${HOME}/.config/mpd/
cp -vr ./dotfiles/.config/ncmpcpp/config ${HOME}/.config/ncmpcpp/
cp -vr ./dotfiles/.config/shell/aliases ${HOME}/.config/shell/
cp -vr ./dotfiles/.config/shell/bash_history ${HOME}/.config/shell/
cp -vr ./dotfiles/.config/shell/zsh_history ${HOME}/.config/shell/
cp -vr ./dotfiles/.config/sxhkd/sxhkdrc ${HOME}/.config/sxhkd/
cp -vr ./dotfiles/.config/bspwm/bspwmrc ${HOME}/.config/bspwm/
cp -vr ./dotfiles/.config/dunst/dunstrc ${HOME}/.config/dunst/
cp -vr ./dotfiles/.config/picom/picom.conf ${HOME}/.config/picom/
cp -vr ./dotfiles/.config/polybar/* ${HOME}/.config/polybar/
cp -vr ./dotfiles/.config/rofi/config.rasi ${HOME}/.config/rofi/



echo "installing vim-plug"
echo
if [ ! -e ${HOME}/.vim/autoload/plug.vim ]; then
  curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# change shell to zsh
chsh -s /usr/bin/zsh

# enable mpd services
systemctl --user enable mpd.service
systemctl --user enable mpd-notification.service
systemctl --user enable mpd-mpris.service
