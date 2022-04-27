# wb24install
bash para instalar el app server webdev 24 en ubuntu 24


# cambiarse a sudo
    $ sudo -i
# clonar el repositorio
    $ cd /home
    $ git clone https://github.com/isdejenuhe/wb24install.git
    $ cd /home/wb24install/
# darle de derechos
    $ chmod 777 ./WASInstall.sh
# correr script
    $ ./WASInstall.sh

te pedira el key de linux 
asignar contraseña al usuario wbuser
en el webdev marcar la opcion de instalar o permitir sitios anteriores(version 23,22,x)
ya que se instale hay que entrar a la pagina http://ip o dominio/WDAdminWeb240 con el usuario ADMIN contraseña admin para cambiar la contraseña admin y crear el usuario wbuser y poner la misma contraseña que se le asigno al usuario de linux

# para que se pueda leer el header de autorization en el api es necesario agregar al apache conf una directiva
    $ nano /etc/apache2/apache2.conf
# al final del archivo conf agregar la siguiente informacion grabar el archivo
    SetEnvIf Authorization "(.*)" HTTP_AUTHORIZATION=$1
# hay que reiniciar el servicios del apache para que cargue las modificaciones
    $ systemctl restart apache2.service

# editar archivo mpm
    $ nano /etc/apache2/mods-available/mpm_event.conf

<IfModule mpm_event_module>
        ServerLimit             188
        StartServers            8
        MinSpareThreads         75
        MaxSpareThreads         250
        ThreadLimit             64
        ThreadsPerChild         32
        MaxRequestWorkers       6000
        MaxConnectionsPerChild  10000
</IfModule>

