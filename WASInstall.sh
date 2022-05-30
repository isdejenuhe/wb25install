#!/bin/bash 

apt update
apt upgrade
apt-get -y dist-upgrade
apt-get -y install build-essential qt5-default libqt5gui5 libfreetype6 apache2 zip unzip ttf-mscorefonts-installer libapache2-mod-fcgid zlib1g-dev freetype2* ttf-*

wget prdownloads.sourceforge.net/webadmin/webmin_1.981_all.deb
dpkg -i webmin_1.981_all.deb
apt-get -y -f install

apt autoremove
apt-get autoremove

ln -s /usr/lib/libfreetype.so.6 /usr/lib/libfreetype.so

mkdir /home/tmp

cd /home/tmp

wget https://package.windev.com/pack/wx26/install/wx26_101d/us/WBDEP26LINUXPACKDVDUS101d.zip?s=N27A012673

mv WBDEP26LINUXPACKDVDUS101d.zip\?s\=N27A012673  WBDEP26LINUXPACKDVDUS101d.zip

unzip WBDEP26LINUXPACKDVDUS101d.zip

cd Linux64x86/

chmod 777 *64

./webdev_install64 

cd /home

rm -rf tmp

rm -rf wb26install
