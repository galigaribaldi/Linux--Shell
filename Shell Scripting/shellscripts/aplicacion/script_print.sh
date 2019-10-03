#!/bin/sh

# FAST: Script para la impresion del contenido del fichero (o de los ficheros del
# directorio) pasado como argumento

clear

if [ -f $1 ]; then
 printf "Impresión en pantalla del fichero \"$1\":\n\n"
 cat $1 | more
elif [ -d $1 ]; then
 printf "Impresión en pantalla de los ficheros del directorio \"$1\":\n\n"
 cd $1; cat * | more
else
 printf "\"$1\" no es un fichero ni un directorio\n"
fi
