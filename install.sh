#!/bin/sh
echo "checking dependencies...\n"
sudo pacman -S --needed bash terminus-font ttf-bitstream-vera xorg-xclock xorg-xdm xorg-xkill xorg-xmessage xorg-xsetroot xorg-xwininfo
sudo mkdir /etc/X11/xdm/simple || exit 1
sudo cp buttons xdm-config Xresources Xsetup Xstartup /etc/X11/xdm/simple/
sudo chmod 0755 /etc/X11/xdm/simple/{Xsetup,Xstartup,buttons}
sudo install -Dm0644 xdm-simple.service /usr/lib/systemd/system/xdm-simple.service
sudo systemctl enable xdm-simple.service
sudo systemctl disable getty@tty2.service # where xdm spawns
echo "done"
