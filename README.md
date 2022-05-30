# wb app server install
bash para instalar el app server webdev 26 en ubuntu 18

# cambiarse a sudo
    $ sudo -i
# clonar el repositorio
    $ cd /home
    $ git clone https://github.com/isdejenuhe/wb26install.git
    $ cd /home/wb26install/
# darle de derechos
    $ chmod 777 ./WASInstall.sh
# correr script
    $ ./WASInstall.sh
# para que se pueda leer el header de autorization en el api es necesario agregar al apache conf una directiva
    $ nano /etc/apache2/apache2.conf
    
# al final del archivo conf agregar la siguiente informacion grabar el archivo
    SetEnvIf Authorization "(.*)" HTTP_AUTHORIZATION=$1

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

# hay que reiniciar el servicios del apache para que cargue las modificaciones
    $ systemctl restart apache2.service
