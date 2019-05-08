#!/bin/sh
sudo cp buttons xdm-config Xresources Xsetup Xstartup /etc/X11/xdm/simple/
sudo chmod 0755 /etc/X11/xdm/simple/{Xsetup,Xstartup,buttons}
sudo install -Dm0644 xdm-simple.service /usr/lib/systemd/system/xdm-simple.service
sudo systemctl enable xdm-simple.service
echo "done"
