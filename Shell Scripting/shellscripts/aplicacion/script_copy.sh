#!/bin/sh

# FAST: Script para la copia de un fichero en otro

ORIGEN=$1
DESTINO=$2
if [ "$#" -lt 2 ]
then
   printf "No ha usado la sintaxis completa: script_copy.sh [origen] [destino]\n"
   if [ -z "$ORIGEN"  ]
   then
      printf "Introduzca el fichero origen: "
      read ORIGEN
   fi
   if [ -z "$DESTINO"  ]
   then
      printf "Introduzca el fichero destino: "
      read DESTINO
   fi
fi

if [ ! -f "$ORIGEN" ]
then
       printf "\nEl fichero origen \"$ORIGEN\" no existe.\n\n"
elif [ -f "$DESTINO" ]
then
    PREG=0
    while [ "0" -eq ${PREG} ]; do
       PREG=1
       printf "¿Desea sobreescribirlo (S/N)? "
       read RESP
       case ${RESP} in
          S | s)
              printf "Realizando la copia: cp %s %s\n" $ORIGEN $DESTINO
              cp "$ORIGEN" "$DESTINO"
              ;;
           N | n)
              printf "\"%s\" no copiado" $ORIGEN
              exit 0
              ;;
          *)
              printf "\nOpción incorrecta\n\n"
              printf "Pulse intro para continuar..."
              read REPLY
              PREG=0
              ;;
       esac
    done
else
    printf "Realizando la copia: cp %s %s\n" $ORIGEN $DESTINO
    cp "$ORIGEN" "$DESTINO"
fi
