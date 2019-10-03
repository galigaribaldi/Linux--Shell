#!/bin/sh

# FAST: Variables importadas desde el script "script1.sh"


CONFIG="-a"
ARP="-n"
ROUTE=""


# Con ese valor de la variable "ARP", si se usase:
# echo $ARP
# El comando "echo" interpretaria el valor de ARP como el parametro "-n" ("echo -n", no hacer salto de línea)
# luego no se imprimiria en pantalla "-n" (valor de "ARP"). Para imprimir el valor de ARP en pantalla,
# cuando este tiene un valor que puede ser interpretado por "echo" como un parámetro (como "-n"),
# podría usarse, por ejemplo:
# a) En "bash":
#    echo -e "$ARP\0000"
#    Para que "-n" se imprima y no se interprete como parametro, es necesario incluirlo entre comillas con algun
#    caracter adicional). Valdria un simple espacio. El hecho de usar el caracter ASCII NULO "000" (el parametro "-e" hace que
#    "\0xxx" sea interpretado como un caracter ASCII en octal) es que es no imprimible, por lo que no afecta a la salida.
#    De este modo, si por ejemplo se ejecuta:
#    echo -n -e "$VAR\0000"; echo "cadena"
#    se obtiene la salida correcta "-ncadena"
#    El problema es que el parametro "-e" no es estandar.
#
# b) En dash:, si en "echo cadena" se usa en cadena cualquier secuencia "\xxx",
#    se representa dicha secuencia como un caracter ASCII, leyendo "xxx" en octal
