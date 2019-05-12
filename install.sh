#!/bin/sh
echo "checking dependencies..."
sudo pacman -S --needed bash xorg-xclock xorg-xdm xorg-xkill xorg-xmessage xorg-xsetroot xorg-xwininfo
sudo mkdir /etc/X11/xdm/simple
sudo cp buttons xdm-config Xresources Xsetup Xstartup /etc/X11/xdm/simple/
sudo chmod 0755 /etc/X11/xdm/simple/{Xsetup,Xstartup,buttons}
sudo install -Dm0644 xdm-simple.service /usr/lib/systemd/system/xdm-simple.service
sudo systemctl enable xdm-simple.service
sudo systemctl disable getty@tty2.service # where xdm spawns
echo "done"
