#!/bin/bash 

apt update
apt upgrade
apt-get -y dist-upgrade
apt-get -y install libqtcore4 libqtgui4 libfreetype6 apache2 zip unzip ttf-mscorefonts-installer
apt autoremove
apt-get autoremove

mkdir /home/tmp

cd /home/tmp

wget https://package.windev.com/pack/wx25/install/wx25_90f/us/WBDEP25LINUXPACKDVDUS090f.zip?s=N27A012673

mv WBDEP25LINUXPACKDVDUS090f.zip\?s\=N27A012673  WBDEP25LINUXPACKDVDUS090f.zip

unzip WBDEP25LINUXPACKDVDUS090f.zip

cd Linux64x86/

chmod 777 *64

./webdev_install64 

cd /home

rm -rf tmp

rm -rf wb24install
