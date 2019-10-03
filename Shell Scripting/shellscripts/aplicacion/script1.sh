#!/bin/sh

# FAST: Script para la administración básica del estado de la red

# La linea siguiente permite invocar "script1.sh" con ruta absoluta, ademas de relativa
DIRRAIZ=`dirname $0`

# Para los scripts "variables.sh" y "funciones.sh" se asume que estan en el mismo directorio que "script1.sh"
# Si estuviesen en otro directorio, bastaria indicarlo explicitamente
# Las comillas son necesarias por si una de las carpetas de "DIRRAIZ" contiene espacios
. "${DIRRAIZ}/variables.sh"
. "${DIRRAIZ}/funciones.sh"

# Comprueba si una variable no tiene valor
#        comprobar_variable   par1  par2  par3
#   + "par1": nombre del comando que usa esa variable
#   + "par2": nombre de la variable
#   + "par3": valor actual de la variable a comprobar
#  Se usa la variable SALIDA de forma global para recuperar la salida de la función "return" solo
#  admite devolver valores numéricos
SALIDA=""
comprobar_variable()
{
  # echo "Comprobando variable \"$2\""

  if [ -z "$3" ]; then
    PREG=0
    while [ "0" -eq "${PREG}" ]; do
       PREG=1
       echo
       echo "La variable \"$2\" esta vacia"
       echo
       echo  "¿Desea indicar algun parametro para el comando \"$1\"? (S/N): "
       read RESP
       case ${RESP} in
          S | s)
              echo "Introduzca el parametro deseado para \"$1\": "
              read PAR
              SALIDA=$PAR
              ;;
           N | n)
              :
              ;;
          *)
              echo
              echo "Opcion incorrecta"
              echo
              echo "Pulse intro para continuar..."
              read REPLY
              PREG=0
              ;;
       esac
    done
  fi
}


clear
echo
echo "Aplicacion para la gestión básica del estado de la red"
echo

comprobar_variable "config" "CONFIG" $CONFIG
if [ -z $CONFIG ]; then CONFIG=$SALIDA; fi

comprobar_variable "arp" "ARP" $ARP
if [ -z $ARP ]; then ARP=$SALIDA; fi

comprobar_variable "route" "ROUTE" $ROUTE
if [ -z $ROUTE ]; then ROUTE=$SALIDA; fi



MENU=0
while [ "0" -eq ${MENU} ]; do
  clear
  echo
  echo "Script de gestion basica del estado de la red."
  echo
  echo "Operaciones disponibles:"
  echo "1) Activar la interfaz de red ${IFACE}"
  echo "2) Desactivar la interfaz de red ${IFACE}"
  echo "3) Mostrar el estado de su configuracion de red"
  echo "4) Salir."
  echo
  echo "Opcion seleccionada: "
  read OPCION
  case ${OPCION} in
    1)
       arranque_red
       ;;
    2)
       parada_red
       ;;
    3)
      echo $CONFIG ${ARP} ${ROUTE}
       estado_red ${CONFIG} ${ARP} ${ROUTE}
       ;;
    4)
      MENU=1
       ;;
    *)
       echo
       echo "Opcion incorrecta"
       echo
       echo "Pulse intro para continuar..."
       read REPLY
       MENU=0
       ;;
   esac
done
