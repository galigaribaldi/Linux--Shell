#!/bin/sh

# FAST: Script para el borrado de los ficheros pasados como argumentos

# No hay ningún problema en usar comodines en los ficheros pasados, dado que son
# interpretados por el comando "rm"

for fichero in $*
do
   # El parametro "-i" obliga a pedir confirmación
   rm -i $fichero
done


# Solución alternativa
# while [ "$*" != "" ]
# do
# 	rm -i $1
# 	shift
# done
