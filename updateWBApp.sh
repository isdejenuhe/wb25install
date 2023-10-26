mkdir /home/tmp

cd /home/tmp
     
wget https://package.windev.com/pack/wx28/install/wx28_95g/us/WBDEP28LINUXPACKDVDUS095g.zip?s=N28A012834

mv WBDEP28LINUXPACKDVDUS095g.zip\?s\=N28A012834  WBDEP28LINUXPACKDVDUS095g.zip

unzip WBDEP28LINUXPACKDVDUS095g.zip

chmod 777 *64

./webdev_install64 

cd /home

rm -rfv tmp

rm -rf wb28install
