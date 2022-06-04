#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "must run as root"
        exit
fi

# running commands to configure the system

systemctl enable NetworkManager
systemctl enable bluetooth
timedatectl set-ntp true

localectl set-locale LANG=en_US.UTF-8

# configure alsa
rm /etc/asound.conf
echo "defaults.pcm.card 1" >> /etc/asound.conf
echo "defaults.ctl.card 1" >> /etc/asound.conf

# touchpad
rm /etc/X11/xorg.conf.d/30-touchpad.conf
echo "Section \"InputClass\"" >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo "      Identifier \"touchpad\"" >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo "      Driver \"libinput\"" >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo "      MatchIsTouchpad \"on\"" >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo "      Option \"Tapping\" \"on\"" >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo "      Option \"NaturalScrolling\" \"true\"" >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo "      Option \"AccelSpeed\" \".08\"" >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo "      Option \"DisableWhileTyping\" \"false\"" >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo "EndSection" >> /etc/X11/xorg.conf.d/30-touchpad.conf

#keyboard
rm /etc/X11/xorg.conf.d/00-keyboard.conf
echo "Section \"InputClass\"" >> /etc/X11/xorg.conf.d/00-keyboard.conf
echo "      Identifier \"system-keyboard\"" >> /etc/X11/xorg.conf.d/00-keyboard.conf
echo "      MatchIsKeyboard \"on\"" >> /etc/X11/xorg.conf.d/00-keyboard.conf
echo "      Option \"XkbLayout\" \"us,ara\"" >> /etc/X11/xorg.conf.d/00-keyboard.conf
echo "      Option \"XkbOptions\" \"grp:alt_shift_toggle\"" >> /etc/X11/xorg.conf.d/00-keyboard.conf
echo "EndSection" >> /etc/X11/xorg.conf.d/00-keyboard.conf



