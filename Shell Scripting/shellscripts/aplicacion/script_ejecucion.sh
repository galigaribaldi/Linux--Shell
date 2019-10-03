#!/bin/sh

# FAST: Script para la asignación del permiso de ejecución a los ficheros pasados como argumentos


for fich in $*
do
    if [ -f "$fich" ]; then
         echo "Asignando permiso de ejecución (de usuario) al fichero '$fich'..."
         chmod u+x "$fich"
    elif [ -d "$fich" ]; then
         echo "Asignando permiso de ejecución (de usuario) al directorio '$fich'..."
         chmod u+x "$fich"
    else
        echo "El parámetro '$fich' no corresponde con ningún fichero ni directorio"
    fi
done
