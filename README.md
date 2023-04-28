# wb app server install
bash para instalar el app server webdev 27 en ubuntu 20

# cambiarse a sudo
    $ sudo -i
# clonar el repositorio
    $ cd /home
    $ git clone https://github.com/isdejenuhe/wb27install.git
    $ cd /home/wb27install/
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

# editar /etc/apache2/mods-available/fcgid.conf agregar FcgidIOTimeout 300 para que no marque error de timeout
FcgidIOTimeout 300

#habilitar modulo unique 
$ a2enmod unique_id

#editar nano /etc/apache2/sites-available/default-ssl.conf
CustomLog ${APACHE_LOG_DIR}/access.log json "expr=%{REQUEST_STATUS} > 304 && %{REQUEST_STATUS} != 403"

#editar nano /etc/apache2/sites-available/000-default.conf
CustomLog ${APACHE_LOG_DIR}/access.log json "expr=%{REQUEST_STATUS} > 304 && %{REQUEST_STATUS} != 403"

#editar nano /etc/apache2/sites-enabled/default-ssl.conf
CustomLog ${APACHE_LOG_DIR}/access.log json "expr=%{REQUEST_STATUS} > 304 && %{REQUEST_STATUS} != 403"

#editar nano /etc/apache2/conf-available/other-vhosts-access-log.conf 
CustomLog ${APACHE_LOG_DIR}/access.log json "expr=%{REQUEST_STATUS} > 304 && %{REQUEST_STATUS} != 403"

# editar archivo mpm
    $ nano /etc/apache2/mods-available/mpm_event.conf

<IfModule mpm_event_module>
        ServerLimit             188
        StartServers            8
        MinSpareThreads         75
        MaxSpareThreads         250
        ThreadLimit             64
        ThreadsPerChild         32
        MaxRequestWorkers       5984
        MaxConnectionsPerChild  10000
</IfModule>

# hay que reiniciar el servicios del apache para que cargue las modificaciones
$ systemctl restart apache2.service

# modificar derechos de la carpeta de log de apache
$ chmod -R go+rX /var/log/apache2/

# modificar los derechos de lograte para permitir leer los archivos de log de apache
$ nano /etc/logrotate.d/apache2
create 666 root adm

# para instalar libreria externa python excel
$ apt install python3-pip
$ pip install XlsxWriter

# instalar driver odbc de postgresql
sudo apt-get install odbc-postgresql,unixodbc 
editar nano /etc/odbc.ini
para crear conexion
[PostgreSQL30]
Description = Conexión a la base de datos de PostgreSQL
Driver = /usr/lib/x86_64-linux-gnu/odbc/psqlodbcw.so
Database = nominatim
Servername = 
UserName = 
Password = 
Port = 

