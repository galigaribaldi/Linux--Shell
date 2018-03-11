#!/bin/bash
#nos dice cuanto ocupa un subdirectorio
#ocupa un directorio
if [ -z $1 ]; then
	echo "Use: ocupa <directorio>"
	exit 1
fi

###Obtiene los directorios y los tamañpos en una lista
lista=$(du -k)
IFS='
'
for fila in $lista
do
	dir=$(echo $fila|cut -f 2)
	let kb=$(echo $fila|cut -f 1)
	let b=1024*kb
	let mb= kb/1024
	echo "$mb MB,  $kb KB, $b B    $dir"
done
