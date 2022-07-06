mkdir -p \
	./dotfiles \
    ./dotfiles/.config \
    ./dotfiles/.config/alacritty \
    ./dotfiles/.config/htop  \
    ./dotfiles/.config/picom  \
    ./dotfiles/.config/mpd  \
    ./dotfiles/.config/ncmpcpp  \
    ./dotfiles/.config/shell  \
    ./dotfiles/.config/sxhkd  \
    ./dotfiles/.config/bspwm    \
    ./dotfiles/.config/dunst    \
    ./dotfiles/.config/polybar  \
    ./dotfiles/.config/rofi     \

 
cp -frv \
	${HOME}/.xprofile \
	${HOME}/.vimrc \
	${HOME}/.bashrc \
	${HOME}/.zshrc \
	${HOME}/.xinitrc \
	${HOME}/.Xresources \
	./dotfiles/

cp -rv ${HOME}/.config/alacritty/alacritty.yml ./dotfiles/.config/alacritty/
cp -rv ${HOME}/.config/htop/htoprc ./dotfiles/.config/htop/
cp -rv ${HOME}/.config/mpd/mpd.conf ./dotfiles/.config/mpd/
cp -rv ${HOME}/.config/ncmpcpp/config ./dotfiles/.config/ncmpcpp/
cp -rv ${HOME}/.config/shell/* ./dotfiles/.config/shell/
cp -rv ${HOME}/.config/sxhkd/sxhkdrc ./dotfiles/.config/sxhkd/
cp -vr ${HOME}/.config/bspwm/bspwmrc ./dotfiles/.config/bspwm/
cp -vr ${HOME}/.config/dunst/dunstrc ./dotfiles/.config/dunst/
cp -vr ${HOME}/.config/picom/picom.conf ./dotfiles/.config/picom/
cp -vr ${HOME}/.config/polybar/* ./dotfiles/.config/polybar/
cp -vr ${HOME}/.config/rofi/config.rasi ./dotfiles/.config/rofi/

