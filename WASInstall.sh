#!/bin/bash 

apt update
apt upgrade
apt-get -y dist-upgrade
apt-get -y install build-essential ca-certificates libqt5widgets5 libqt5gui5 libfreetype6 apache2 zip unzip ttf-mscorefonts-installer libapache2-mod-fcgid zlib1g-dev freetype2* ttf-*
apt autoremove
apt-get autoremove

ln -s /usr/lib/libfreetype.so.6 /usr/lib/libfreetype.so

mkdir /home/tmp

cd /home/tmp
     
wget https://package.windev.com/pack/wx28/install/wx28_94s/us/WBDEP28LINUXPACKDVDUS094s.zip?s=N28A012834

mv WBDEP28LINUXPACKDVDUS094s.zip\?s\=N28A012834  WBDEP28LINUXPACKDVDUS094s.zip

unzip WBDEP28LINUXPACKDVDUS094s.zip

chmod 777 *64

./webdev_install64 

cd /home

rm -rf tmp

rm -rf wb28install
