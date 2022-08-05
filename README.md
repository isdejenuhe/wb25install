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
    
# integrar formato json para custom log
LogFormat "{\"_id\":\"%{UNIQUE_ID}e\",\"start\":{\"$date\":%{msec}t},\"srv\":\"%A\",\"host\":\"%{REQUEST_SCHEME}e://%{Host}i\",\"dur\":%{ms}T,\"cli\":{\"ip\":\"%a\"},\"ok\":false,\"sis\":\"APACHE\",\"proc\":\"%U%q\",\"trace\":\"APAHE ERROR:%>s %s METODO:%m %{User-agent}i\",\"mime\":\"%{Content-Type}i\",\"refer\":\"%{Referer}i\",\"szReq\":%I}" json

# al final del archivo conf agregar la siguiente informacion grabar el archivo
    SetEnvIf Authorization "(.*)" HTTP_AUTHORIZATION=$1

#editar /etc/apache2/conf-available/other-vhosts-access-log.conf modificar directiva customlog
CustomLog ${APACHE_LOG_DIR}/access.log json "expr=%{REQUEST_STATUS} > 304"

# editar /etc/apache2/mods-available/fcgid.conf agregar FcgidIOTimeout 300 para que no marque error de timeout
FcgidIOTimeout 300

# editar archivo mpm
    $ nano /etc/apache2/mods-available/mpm_event.conf

#habilitar modulo unique 
$ a2enmod unique_id

#editar /etc/apache2# nano ./sites-available/default-ssl.conf
CustomLog ${APACHE_LOG_DIR}/access.log json "expr=%{REQUEST_STATUS} > 304"

#editar /etc/apache2# nano ./sites-available/000-default.conf
CustomLog ${APACHE_LOG_DIR}/access.log json "expr=%{REQUEST_STATUS} > 304"

#editar /etc/apache2# nano ./sites-enabled/default-ssl.conf
CustomLog ${APACHE_LOG_DIR}/access.log json "expr=%{REQUEST_STATUS} > 304"

# hay que reiniciar el servicios del apache para que cargue las modificaciones
    $ systemctl restart apache2.service

#modificar derechos de la carpeta de log de apache
$chmod -R go+rX /var/log/apache2/
