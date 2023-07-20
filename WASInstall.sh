#!/bin/bash 

apt update
apt upgrade
apt-get -y dist-upgrade
apt-get -y install apache2 zip unzip libapache2-mod-fcgid libqt5quickcontrols2-5 libqt5multimedia5 libqt5webengine5 libqt5quick5 libqt5qml5
apt autoremove
apt-get autoremove

ln -s /usr/lib/libfreetype.so.6 /usr/lib/libfreetype.so

mkdir /home/tmp

cd /home/tmp
     
wget https://package.windev.com/pack/wx28/install/wx28_94s/us/WBDEP28LINUXPACKDVDUS094s.zip?s=N28A012834

mv WBDEP28LINUXPACKDVDUS094s.zip\?s\=N28A012834  WBDEP28LINUXPACKDVDUS094s.zip

unzip WBDEP28LINUXPACKDVDUS094s.zip

cd Linux64x86/

chmod 777 *64

./webdev_install64 

cd /home

rm -rf tmp

rm -rf wb28install
