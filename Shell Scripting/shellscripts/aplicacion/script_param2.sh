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

CADENA_PROCESO=""
CADENA_PARA_ANALIZAR=$1
# El bucle se ejecuta mientras la cadana vaya cambiando en cada pasada
while [ "$CADENA_PROCESO" != "$CADENA_PARA_ANALIZAR" ]
do
    CADENA_PROCESO=$CADENA_PARA_ANALIZAR
    # Extraemos el nombre y valor de los dos primeros parámetros
    PAR=${CADENA_PROCESO%%&*} #quitamos desde el primer &
    asignaValor "${PAR%=*}" "${PAR#*=}"  #campo=valor
    #Actualizamos CADENA_PARA_ANALIZAR
    #quitamos hasta el primer & incluido
    CADENA_PARA_ANALIZAR=${CADENA_PROCESO#*&} 
done

printf "Cadena analizada: '%s'\n" "$1"
printf "Nombre: %s, Edad: %s, Teléfono: %s.\n"  "$NOMBRE" "$EDAD" "$TELEFONO"



