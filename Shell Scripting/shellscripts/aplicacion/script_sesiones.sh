#!/bin/sh

# FAST: Script que imprime el número de sesiones actuales del usuario pasado como argumento
if test -z "$1"; then
	set `id -un`  # $1=nombre del usuario actual
fi
sesiones=`who | grep -e "^$1 " | wc -l`
printf "El usuario \"%s\" tiene abiertas %d sesiones\n" $1 $sesiones
