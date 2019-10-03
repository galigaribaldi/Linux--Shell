#!/bin/sh

# FAST: Script con un menú para usar los demas scripts

# Asumimos que los demás scripts se encuentran en el mismo directorio que este
# y que poseen permiso de ejecución
# Obtenemos el directorio en que se encuentra el script actual
DIRRAIZ=`dirname $0`/

MENU=0
while [ "0" -eq ${MENU} ]; do
  OPCION=""
  ARCHIVOS=""
  USUARIO=""
  PARAMETROS=""
  clear
  cat << EOF
Menú de acceso a los demás scripts

Seleccione el script que desea usar:

 1) "script1.sh":          Administración básica del estado de la red
 2) "script_copy.sh":      Copia de un fichero en otro
 3) "script_print.sh":     Impresión del contenido de un fichero (o ficheros de un directorio)
 4) "script_borrar.sh":    Borrado de los ficheros indicados
 5) "script_sesiones.sh":  Número de sesiones actuales del usuario indicado
 6) "script_mostrar.sh":   Impresión del contenido de ficheros o listado de los directorios indicados
 7) "script_ejecucion.sh": Asignación del permiso de ejecucion a los ficheros indicados
 8) "script_doble.sh":     Calculo del valor doble de un numero
 9) "script_tipos.sh":     Calculo del numero de ficheros "regulares/directorios" en una carpeta
10) "script_user.sh":      Información del usuario indicado

 q) Salir.

Opcion seleccionada: 
EOF

  read OPCION
  echo
  case ${OPCION} in
    1)
      # No usamos ".  script" porque conlleva algunas dificultades:
      # 1º Estariamos usando el mismo espacio de variables para este script y para los invocados
      # 2º Si un script usa "exit", se saldrá de este script también
      "${DIRRAIZ}"script1.sh
      ;;
    2)
      "${DIRRAIZ}"script_copy.sh
      ;;
    3)
      echo "Introduzca el fichero o directorio a imprimir: "
      read ARCHIVOS
      "${DIRRAIZ}"script_print.sh ${ARCHIVOS}
      ;;
    4)
      echo "Introduzca los ficheros a borrar: "
      read ARCHIVOS
      "${DIRRAIZ}"script_borrar.sh ${ARCHIVOS}
      ;;
    5)
      echo "Introduzca el login del usuario cuyo Nº de sesiones desea conocer: "
      read USUARIO
      "${DIRRAIZ}"script_sesiones.sh ${USUARIO}
      ;;
    6)
      echo "Introduzca los ficheros o directorios a imprimir o listas: "
      read ARCHIVOS
      "${DIRRAIZ}"script_mostrar.sh ${ARCHIVOS}
      ;;
    7)
      echo "Introduzca los ficheros a los que asignar permiso de ejecución: "
      read ARCHIVOS
      "${DIRRAIZ}"script_ejecucion.sh ${ARCHIVOS}
      ;;
    8)
      "${DIRRAIZ}"script_doble.sh
      ;;
    9)
      echo "Introduzca la carpera de la que desea hacer el analisis: "
      read ARCHIVOS
      "${DIRRAIZ}"script_tipos.sh ${ARCHIVOS}
      ;;
    10)
      clear
      echo "Introduzca el usuario (con --help para más información): "
      read PARAMETROS
      "${DIRRAIZ}"script_user.sh ${PARAMETROS}
      ;;
    q)
       MENU=1
       exit 0
       ;;
    *)
       printf "\nOpción incorrecta\n\nPulse intro para continuar..."
       read REPLY
       MENU=0
       ;;
   esac
   echo
   echo "Pulse intro para continuar..."
   read REPLY
done
