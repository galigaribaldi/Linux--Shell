#!/bin/bash

type "comando" -> saber de donde viene cada comando

##############################Ejemplo con Fi if##########
#echo -n "palabra 1: "
#read palabra
#echo -n "palabra 2: "
#read palabra2
###################usando Cadenas con read
function condicion
{
if test "$palabra" = "$palabra2" ##Pregunta sobre  el estadode un argumento
	then
		echo "Son Iguales"
	else
		echo "No son iguales"
fi
}
########3###################desde consola
function condicion_2
{
if test $# -eq 0
	then
		echo "Debe proporcionar un argumento"
		exit 1
fi
}
######################################################3

