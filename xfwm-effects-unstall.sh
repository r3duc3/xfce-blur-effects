#!/bin/bash
# UNSTALLER SCRIPT FOR XUBUNTU; OTHER DISTROS WILL NEED CHANGES TO SCRIPT ETC.
# this script unstalls a hacked xfwm window manager to usr/local/bin 
# (the hack allows for translucency effects); it also unstalls an app 
# called xfwm-effects to adjust the effect settings

echo "----------------------------------------------------------"
echo "Xfce Effects (v.1.5.0) Unstall Script for Xubuntu 21.04"
echo "Unstalling xfwm translucency hack and xfwm-effects panel..."
echo "----------------------------------------------------------"

# run as root?
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

# unstall xfwm hack:

# unstall hacked 'xfwm' from '/usr/local/bin/'
# this will restore the original 'xfwm' in '/usr/bin/'
rm /usr/local/bin/xfwm4
# unstall 'xfwm-effects.xml' from '/home/user/.config/xfce4/xfconf/xfce-perchannel-xml/'
rm ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm-effects.xml
# remove 'xfwm4' folder from '/usr/local/share/xfwm4'
rm -rf /usr/local/share/xfwm4

# unstall xfwm-effects panel app:

# unstall 'xfwm-effects' binary from 'usr/local/bin/'
rm /usr/local/bin/xfwm-effects
# unstall 'xfwm-effects.desktop' from 'usr/local/share/applications/'
rm /usr/local/share/applications/xfwm-effects.desktop
# remove 'xfwm-effects' folder from '/usr/local/share/xfwm-effects'
rm -rf /usr/local/share/xfwm-effects/

echo " "
echo "----------------------------------------------------------"
echo "Unstalling Imlib2 library (for blur effects)..."
echo "----------------------------------------------------------"

# the blur effects are created by Imlib2 library

pacman -Rnscuv imlib2

echo " "
echo "----------------------------------------------------------"
echo "Switch back to original xfwm4" 
/usr/bin/xfwm4 --replace & disown
echo "logout if needed"
echo "----------------------------------------------------------"

