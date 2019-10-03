#!/bin/sh
#Analisis de cadena tipo "nombre=valor1&edad=valor2&telefono=valor3"
NOMBRE=
EDAD=
TELEFONO=

asignaValor()
{
    CAMPO=$1
    VALOR=$2
    case $CAMPO in
	nombre)
	    NOMBRE=$VALOR;;
	edad)
	    EDAD=$VALOR;;
	telefono)
	    TELEFONO=$VALOR;;
    esac
}

QUERY_STRING=$1

# Contamos el número de parámetros y guardamos los dos primeros
IFS="&"      # Variable shell con el carácter de separación
for PAR in $QUERY_STRING
do
    # Extraemos el nombre y valor de los dos primeros parámetros
    IFS="="    # Carácter de separacion entre nombre y valor
    asignaValor $PAR
done

printf "Cadena analizada: '%s'\n" "$QUERY_STRING"
printf "Nombre: %s, Edad: %s, Teléfono: %s.\n"  "$NOMBRE" "$EDAD" "$TELEFONO"


