#!/bin/bash

type "comando" -> saber de donde viene cada comando
###################usando Cadenas con read
function fis
{
if test "$palabra" = "$palabra2" ##Pregunta sobre  el estadode un argumento
	then
		echo "Son Iguales"
	else
		echo "No son iguales"
fi
}
########3###################desde consola
function if_num
{
if test $# -eq 0
	then
		echo "Debe proporcionar un argumento"
		exit 1
fi
echo "Fin"
}
######################################################3
fis
if_num
