#!/bin/bash

################3#ciclo for en una lista
function ciclo
{
for i in 1 2 3 4 5; do
	echo $i
done
}
###############################################3

############Ciclo for en una secuencia de numeros
function secuencia
{
for i in $(seq 1 10); do
	echo $i
done
}
###############################################

############# listando lo que hay en directorios Tarea
function directorios
{
for i in *
do
	if [ -d "$i" ]
		then
			echo "$i"
	fi
done
}
######################################
###Tarea: Hacer un Script el cual consiga listar todos los archovos y directorios de la carpteta actual
######## utlizando un ciclo for
