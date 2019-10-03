#!/bin/sh

# FAST: Script para la impresion del contenido de los ficheros y listado de los directorios pasados como argumentos

clear

for fich in $*
do
   echo
   if [ -d "$fich" ]; then
      echo "Mostrando el listado del directorio \"$fich\":"
      ls -la "$fich" | more
   elif [ -f "$fich" ]; then
      echo "Mostrando el contenido del archivo \"$fich\":"
      cat "$fich"
   else
      echo "El parametro \"$fich\" no corresponde con ningun archivo ni directorio"
   fi
done
