#!/bin/bash 

apt update
apt upgrade
apt-get -y dist-upgrade
apt-get -y install libqtcore4 libqtgui4 libfreetype6 apache2 zip unzip ttf-mscorefonts-installer
apt autoremove
apt-get autoremove

mkdir /home/tmp

cd /home/tmp

wget https://package.windev.com/pack/wx24_77f/us/webdev/WBDEP24LINUX64PACKUS077f.zip

unzip  WBDEP24LINUX64PACKUS077f.zip

chmod 777 *64

./webdev_update64

echo "Enter password for wbuser"
adduser wbuser
usermod -a -G webdevadmin wbuser
usermod -a -G wbuser www-data
usermod -a -G webdevadmin www-data
usermod -a -G root www-data
mkdir /home/wbuser/data
mkdir /home/wbuser/site
mkdir /home/wbuser/webserviceREST
mkdir /home/wbuser/webserviceSOAP
mkdir /home/wbuser/ftp_webdev
chgrp webdevadmin /home/wbuser/data
chgrp webdevadmin /home/wbuser/site
chgrp webdevadmin /home/wbuser/webserviceREST
chgrp webdevadmin /home/wbuser/webserviceSOAP
chgrp webdevadmin /home/wbuser/ftp_webdev
chmod ug+rwx /home/wbuser/data
chmod ug+rwx /home/wbuser/site
chmod ug+rwx /home/wbuser/webserviceREST
chmod ug+rwx /home/wbuser/webserviceSOAP
chmod ug+rwx /home/wbuser/ftp_webdev

cd /home

rm -rf tmp

rm -rf wb24install
