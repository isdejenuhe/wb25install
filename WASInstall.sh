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

echo "Enter password for wbuser"
adduser WBUSER
usermod -a -G webdevadmin WBUSER
usermod -a -G WBUSER www-data
usermod -a -G webdevadmin www-data
usermod -a -G root www-data
mkdir /home/WBUSER/data
mkdir /home/WBUSER/site
mkdir /home/WBUSER/webserviceREST
mkdir /home/WBUSER/webserviceSOAP
mkdir /home/WBUSER/ftp_webdev
chgrp webdevadmin /home/wbuser/data
chgrp webdevadmin /home/wbuser/site
chgrp webdevadmin /home/wbuser/webserviceREST
chgrp webdevadmin /home/wbuser/webserviceSOAP
chgrp webdevadmin /home/wbuser/ftp_webdev
chmod ug+rwx /home/WBUSER/data
chmod ug+rwx /home/WBUSER/site
chmod ug+rwx /home/WBUSER/webserviceREST
chmod ug+rwx /home/WBUSER/webserviceSOAP
chmod ug+rwx /home/WBUSER/ftp_webdev

cd /home

rm -rf tmp

rm -rf wb24install
