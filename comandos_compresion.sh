##################################################Empaquetar con "tar"
###Empaquetar archivos
tar cvf "archivo.tar" "archivos a comprimir"

##Desempaquetar Archivos
tar xvf "archivos.tar"

###ver el contenido sin extraer
tar tvf "archivo.tar"
######################################################

########################Empaquetar y comprimir con ".tar.gz"
### Empaquetar y comprimir
tar czvf "Archivo.tar.gz" "Archivos a comprimir"

#####Desempaquetar y descomprimir
tar xzvf "archivo.tar.gz"

###Ver el contenido sin extraer
tar tzvf "Archivo.tar.gz"
#####################################

###########Comprimir con "gz"
gzip -9 "archivo"

##Descomprimir
gzip -d fichero.gz
################################3

##############Comprimir con zip
###comprimir con Zip
zip "archivo.zip" "a comprimir"

###Descomprimir con Zip
unzip "archivo.zip"

##Ver el contenido de un fichero
unzip -v "archivo.zip"
###########################################

####Ficheros rar -> rar no esta instalado, hayq eu instalarlo con un comando
###comprimir
rar -a "archivo.rar" "a comprimir"

##Decomprimir
unrar -x "archivo.rar"

###Ver el contenido de un fichero rar
unrar -v "archivo.rar"
unrar -l "archivo.rar"
#########################comando dd###############################################
#MONTAR UNA IMAGEN ".ISO"
sudo dd if="ruta del iso/archivo.iso" of="dev/sdb/disco de montaje" bs=4M

#####clonar archivos
dd if="ruta del archivo a clonar" of="ruta del montaje"



