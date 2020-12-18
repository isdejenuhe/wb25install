# wb24install
bash para instalar el app server webdev 24 en ubuntu 24


#cambiarse a sudo
    $ sudo -i
#clonar el repositorio
    $ cd /home
    $ git clone https://github.com/isdejenuhe/wb24install.git
    $ cd /home/wb24install/
#darle de derechos
    $ chmod 777 ./WASInstall.sh
#correr script
    $ ./WASInstall.sh

#te pedira el key de linux
#asignar contraseña al usuario wbuser
#en el webdev marcar la opcion de instalar o permitir sitios anteriores(version 23,22,x)
# ya que se instale hay que entrar a la pagina http://ip o dominio/WDAdminWeb240 con el usuario ADMIN contraseña admin para cambiar la contraseña admin y crear el usuario wbuser y poner la misma contraseña que se le asigno al usuario de linux
# hay que reiniciar el servicios del apache
    $ systemctl restart apache2.service

