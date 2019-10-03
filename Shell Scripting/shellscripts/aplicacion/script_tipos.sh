#!/bin/sh

# FAST: Script que calcula el número de ficheros de cada tipo (regulares/directorios) en una carpeta

clear
DIR=$1
if [ -z "$DIR" ]; then
   printf "Sin argumentos. Usando el directorio actual '$(pwd)'\n"
   DIR=`pwd`
elif [ ! -d "${DIR}" ]; then
   printf "El parámetro introducido no corresponde con un directorio\n"
   exit 1
fi

printf "\nFicheros regulares/Directorios de la carpeta '$DIR':\n\n"

NFICH=0
NDIR=0
for arch in `ls "$DIR"`
do
    if [ -f "$DIR/$arch" ]; then
        NFICH=$(($NFICH+1))
        printf "Fichero regular: $arch\n"
    elif [ -d "$DIR/$arch" ]; then
        NDIR=$(($NDIR+1))
        printf "Directorio: $arch\n"
    fi
done

printf "\nRESUMEN:\n\
	  Número de ficheros regulares: $NFICH\n \
	  Número de directorios: $NDIR\n"

# Innecesario:
# exit 0
