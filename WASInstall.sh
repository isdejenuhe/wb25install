#!/bin/bash 

apt update
apt upgrade -y
apt-get update
apt-get dist-upgrade -y
apt-get install -y wget unzip --no-install-recommends 
apt-get install -y ca-certificates apache2 libapache2-mod-fcgid libqt5widgets5 --no-install-recommends 
#apt-get -y install build-essential ca-certificates libqt5widgets5 libqt5gui5 libfreetype6 apache2 zip unzip ttf-mscorefonts-installer libapache2-mod-fcgid zlib1g-dev freetype2* ttf-*
apt autoremove
apt autoclean
apt autopurge
apt-get autoremove

#ln -s /usr/lib/libfreetype.so.6 /usr/lib/libfreetype.so

mkdir /home/tmp

cd /home/tmp
     
wget -nv -O WEBDEV_Install64.zip https://package.windev.com/pack/wx28/install/wx28_95g/us/WBDEP28LINUXPACKDVDUS095g.zip?s=N28A012834 && echo "acf0c61997dd6644e0ae24f365edaa41a91cb79e37bdd948b1137e58a54658e8 *WEBDEV_Install64.zip" | sha256sum -c - 

unzip -b -j WEBDEV_Install64.zip 

chmod 550 webdev_install64

./webdev_install64 

cd /home

rm -rf tmp

rm -rf wb28install
