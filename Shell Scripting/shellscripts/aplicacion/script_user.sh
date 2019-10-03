#!/bin/sh

# FAST: Script que imprime información del usuario pasado como argumento
# Sintaxis:
#   script_user.sh         user
#   script_user.sh  -p     user
#   script_user.sh  -u     user
#   script_user.sh  --help user
#
# + "-p": solo muestra la información de los procesos
# + "-u": mostrar toda la información salvo la referente a los procesos
# "--help": muestra la sintaxis de uso del script
# NOTA: Los parámetros pueden estar antes o después del "user"

#### VARIABLES ####
PARp="N"
PARu="N"
PARh="N"
USER="N"


#### FUNCIONES ####
# Función que permite obtener el nombre del script actual
# para cualquiera de las posibles formas de invocación
NOMBRE=""
nombre_script()
{
  # Esta función es opcional
  # Comprobamos si se ha usado ".  script" o "bash  script"
  NOMBRE=`basename $BASH_SOURCE 2> /dev/null`
  CHECK=$?
  if [ $CHECK -ne 0 ]; then
     # Si no se ha usado ". script", sino "script" o "/ruta/script"
     NOMBRE=`basename $0`
  fi
}

# Función que imprime la sintaxis de uso del script
ayuda()
{
   nombre_script
   cat <<- FIN
		Script que imprime información del usuario pasado como argumento

		Sintaxis:
		${NOMBRE}         user
		${NOMBRE}  -p     user
		${NOMBRE}  -u     user
		${NOMBRE}  --help user

		Parametros:
		  -p	 	solo muestra la información de los procesos
		  -u	 	mostrar toda la información salvo la referente a los procesos
		  --help	muestra la sintaxis de uso del script
		NOTA: Los parámetros pueden estar antes o después del "user"

	FIN

}


# Función que busca en el fichero pasado como primer argumento ($1) las lineas cuyo
# campo de la posición N=$2 (empezando por "0") tenga EXACTAMENTE el valor X=$3, usando el
# carácter o caracteres "S"=$4 como separador de campos.
# Devuelve en la variable global "LINEAS" las líneas que cumplan ese requisito
# Sintaxis:  buscar_lineas  "$VAR"         N     "X"       "S"
# Ejemplo:   buscar_lineas  "/etc/passwd"  "0"   "dit"   ":"

# Variable de entorno "IFS": permite indicar el separador entre campos (por ejemplo,
# entre los argumentos pasados a un script, una función o de un bucle "for i in CAMPOS")
# Si no esta definida, el separador adoptado por el interprete es un "espacio", una tabulación
# o un cambio de línea  (valor usado en general; por ejemplo, los argumentos pasados
# a un script se separan pos espacios)

LINEAS=""
buscar_lineas()
{
   # Reseteamos la variable de salida
   LINEAS=""
   # Para cada linea del fichero
   while read linea
   do
      IFS="$4"
      CONT=0
      # Para cada uno de los campos de la linea
      for palabra in $linea
      do
         # Buscamos el campo de la posición "N=$2" y comprobamos si
         # su valor es "X=$3". En caso afirmativo, añadimos la linea a "SAL"
         if [ $CONT -eq $2 -a "$palabra" = "$3" ]; then
             # En la variable "LINEAS" seguimos añadiendo el retorno de carro "\n"
             # Para separar las líneas
             LINEAS="$LINEAS\n$linea"
         fi
         CONT=$((CONT+1))
      done
   done < $1

   # NOTA: "$1" debe ser el nombre de un fichero

   # Eliminamos la variable IFS para que el shell vuelva a usar su valor por omisión
   unset IFS
}


# Función que busca en la cadena pasada "LINEA=$1" el campo ubicado en
# la posición "N=$2" indicada, usando el carácter "S=$3" como separador de campos
# devolviendo el valor de dicho campo en la variable global "CAMPO"
# Sintaxis:  extraer_campo  "LINEA"   POS   "SEPARADOR"
# Ejemplo:   extraer_campo  "$LINEA"  2     ":"
CAMPO=""
extraer_campo()
{
    # Reseteamos la variable de salida
    CAMPO=""

    # Extraemos de dicha línea el valor del campo ubicado en la "posicion=$2"
    # Y lo devolvemos en la variable "CAMPO"
    IFS="$3"
    CONT=0
    for i in $1
    do
        if [ $CONT -eq $2 ]; then CAMPO=$i; fi
        CONT=$((CONT+1))
    done

    unset IFS
}


# Los datos del usuario (Nombre completo, HOME, shell, ...) se definen en /etc/passwd
# (esa información es impresa por comandos como "finger usuario"; también podría ser
# capturada de la salida de estos comandos insertándola en variables)
# Dichos campos se encuentran separados por el carácter ":"
# Para extraer dichos campos puede hacerse uso de la variable "IFS"

# La siguiente función se encarga de consultar el fichero "/etc/passwd" y guardar
# en la variable global "CAMPO" el valor del campo, del usuario paso como primer
# argumento, ubicado en la posicion indicado en el segundo argumento
# Sintaxis:                         datos_passwd   usuario   posicion
# Ejemplo (extraer HOME de afast):  datos_passwd   "afast"   5
#  POSICION    CAMPO
#    0		LOGIN
#    1		CLAVE
#    2		UID
#    3		GID
#    4		NOMBRE COMPLETO
#    5		HOME
#    6		SHELL
datos_passwd()
{
    SEPARADOR=":"

    # Pueden plantearse dos mecanismos para extraer esta información del fichero "passwd":
    # 1) Usando los comandos "grep" y "cut" ("cut" numera con "1" al primer campo, no con "0")
    #    CAMPO=`grep -e "^$1:.*" /etc/passwd | cut -d "${SEPARADOR}" -f $(($2+1)) -`

    # Si en lugar de buscar la línea de "/etc/passwd" por el usuario, se desee buscar por otro
    # campo, bastaría ajustar la expresión regular. Por ejemplo, para buscarla por el GID sería:
    # grep -e ".*:.*:.*:1000:.*" /etc/passwd


    # 2) Mediante funciones del shell y la variable "IFS":
    # Buscar la línea de /etc/passwd asociada al usuario $1 (resultado en variable "LINEAS")
    buscar_lineas  "/etc/passwd"  "0"   "$1"   "${SEPARADOR}"
    # De dicha línea del usuario $1, extraer el campo
    extraer_campo  "$LINEAS"  "$2"   "${SEPARADOR}"
}


#### CUERPO DEL SCRIPT ####

# Obtenemos los parámetros pasados en la invocación del script
NUMPARAM=0
for param in $*
do
   if    [ "$param" = "-p" ];     then
      PARp="S"
      NUMPARAM=$((NUMPARAM+1))
   elif  [ "$param" = "-u" ];     then
      PARu="S"
      NUMPARAM=$((NUMPARAM+1))
   elif  [ "$param" = "--help" ]; then
      PARh="S"
      NUMPARAM=$((NUMPARAM+1))
   else
      USER=$param
   fi
done

# Analizamos los parámetros detectados
# Solo debe haber un párametro, son incompatibles
if [ $NUMPARAM -gt 1 ]; then
   printf "\nDemasiados parámetros\n"
   ayuda
   exit 1
fi

# Comprobamos la existencia del usuario
id $USER > /dev/null 2>&1
if [ $? -eq 1 ]; then
    printf "\nEl usuario introducido como argumento no existe\n"
    exit 2
fi

# Procesamos los argumentos
# Parámetro de ayuda "--help"
if [ "$PARh" = "S" ]; then
   ayuda
   exit 0
fi

# Salida de información condicionada por los otros argumentos
printf "\nScript que imprime información del usuario pasado como argumento\n"
printf "\nUsuario indicado: $USER\n"

# Si NO se ha puesto "-p", se imprime la información propia del usuario
if [ "$PARp" = "N" ]; then
   # Obtenemos el nombre completo del usuario
   datos_passwd  $USER   4
   if [ $? -eq 0 ]; then
       NOMBRE_COMPLETO=$CAMPO
   else
       NOMBRE_COMPLETO="No obtenido"
   fi

   # Obtenemos el HOME
   datos_passwd  $USER   5
   if [ $? -eq 0 ]; then
       HOME_USER=$CAMPO
   else
       HOME_USER="No obtenido"
   fi

   # Obtenemos el SHELL por defecto
   datos_passwd  $USER   6
   if [ $? -eq 0 ]; then
       SHELL_USER=$CAMPO
   else
       SHELL_USER="No obtenido"
   fi

   # Imprimimos la informacion
   cat <<- FIN
	+ Login:               $USER
	+ Nombre completo:     $NOMBRE_COMPLETO
	+ Directorio "home":   $HOME_USER
	+ Shell por defecto:   $SHELL_USER
	+ Número de sesiones actualmente abiertas: `who | grep $USER | wc -l`

	FIN

fi

# Si NO se ha puesto "-u", se imprime la información de los procesos del usuario
if [ "$PARu" = "N" ]; then
    printf "\nProcesos pertenecientes al usuario $USER: \n"

    # Pueden plantearse dos mecanismos para extraer esta información del fichero "passwd":
    # 1) Usando el comando grep (la salida de "ps" usa espacios como separadores)
    #    ps aux | grep -e "^${USER} " | more

    # 2) Mediante funciones del shell y la variable "IFS":
    # Guardar la salida de "ps aux" en un fichero (la entrada estándar al "while" de
    # la funciones "buscar_lineas" debe ser un fichero)
    FICHERO_TMP="/tmp/procesos_${USER}_`date +%H:%M:%S_%d-%m-%Y`"
    ps aux > "${FICHERO_TMP}"

    # Buscar en ese fichero las líneas asociadas al usuario $USER (ubicado en el primer campo de cada línea)
    SEPARADOR=" "
    buscar_lineas  "${FICHERO_TMP}"  "0"   "$USER"   "${SEPARADOR}"

    # Borramos el fichero temporal
    rm -f ${FICHERO_TMP}

    # Obtenemos en "LINEAS" los procesos del usuario $USER. Los imprimimos
    echo $LINEAS

    # Respecto a la salida normal de "ps", se esta perdiendo la tabulación de las columnas
    # dado que los espacios se estan usando como separador "IFS"
fi
