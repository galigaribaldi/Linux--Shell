#listando lo que hay en un archivo
#.deb
## ar manejar archivos .deb on opciones
ar t "archivo" ##muestra los archivos
ar x "archivo" ##los desempaqueta o extrae
ar d "Archivo" ##elimina
tar -xvf "data (Archivo)" | head -15 ##Desempaquetar archivos ".xz"
tar tzf "Archivo (control)"
nano debian-binary
cat "debian-binary"
#Debian Binary = Version del archivo .deb
#control.tar = herramientas de gestion de paquetes, nombre, version, instalar o desinstalar
#data.tar = Archivos ejecutables y documentacion
apt-cache show apt | less ##Archios de cabecera documentación de un archivo de control, APT en este caso
##los scripts de configuración se encentran en
cd /var/lib/dpkg/info
ls | less ##mostrar secuencial los scripts de configracion
nano -v "archivo" #postrm = despues de quitarse list = Lista de oras configuraciones, #pos
dpkg --get--selections
dpkg -i "paquete a instalar"
dpkg --configure --pending "Paquete" ##Reconfigura los paquetes a desear
dpkg --configure -a "Repara el sistema"
###instalar Opera, Google Chrome y WPS Kingsoft
###comandos
sudo apt-get install cowsay
sudo apt-get install fortune
sudo apt-get install figlet
sudo apt-get install cmatrix
##sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
####Consola fish
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update ##Actualiza los repositorios
sudo apt-get upgrade ###Descarga las actualizaciones de repositorios
sudo apt-get install fish
##### Tarea: instalar Atom Editor o "Brackets Editor"
