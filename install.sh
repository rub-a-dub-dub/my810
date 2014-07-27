#!/bin/bash

# 
# This script will install additional packages to 
# get a Debian system up and running for Pi-like work
# as well as configure the system for Pi-like needs. I
# assume that you are running this as root.
#

# 1. System debs
apt-get -y install usbutils link curl minicab x11vnc openjdk-7-jre mplayer motion cheese blueman librxtx-java

# 2. Calibrator for the touchscreen
wget http://github.com/downloads/tias/xinput_calibrator/xinput-calibrator_0.7.5-1_i386.deb -O /tmp/xinput_calibrator.deb
dpkg -i /tmp/xinput_calibrator.deb

# 3. Webcam support
apt-get -y install libusb-dev libglib2.0-dev		# these are to compile the webcam module
cd r5u87x
make
make install
r5u87x-loader --reload
cd ..

# 4. Stop lightdm from loading in init2
mv /etc/rc2.d/S18lightdm /etc/rc2.d/K18lightdm
update-rc.d lightdm defaults

# 5. Edit /usr/share/X11/xorg.conf.d/10-evdev.conf 
# 	 to add touchscreen and cal info. Use xinput_calibrator
#	 to change cal info if needed.

echo 'Section "InputClass"
	Identifier	"calibration"
	MatchProduct	"Fujitsu Component USB Touch Panel"
	Option	"Calibration"	"139 3695 279 3914"
EndSection' > /usr/share/X11/xorg.conf.d/99-calibration.conf

echo '37c37
<         MatchIsTouchscreen "on"
---
>         #MatchIsTouchscreen "on"
39a40
> 	MatchUSBID "05ca:1841"'| patch -p0 /usr/share/X11/xorg.conf.d/10-evdev.conf

# 6. Change PCMCIA config to allow mapping of CF cards
echo '26a27
> include memory 0xf0000000-0xf0ffffff' | patch -p0 /etc/pcmcia/config.opts

# 7. Autologin root
echo '54c54
< 1:2345:respawn:/sbin/getty 38400 tty1
---
> 1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1' | patch -p0 /etc/inittab

# 8. Auto startx
echo '13a14
> su -l root -c startx' | patch -p0 /etc/rc.local