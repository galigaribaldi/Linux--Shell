#!/bin/sh

# FAST: Script que calcula el doble de un número solicitado

#Función que comprueba si el valor del primer argumento es un número entero
comprueba_entero()
{
    echo $1 | grep -q "^-\?[0-9]\+$" 2>&1
    #devuelve 0 si $1 cumple el patrón del grep: comienza con un "-" opcional,
    # seguido de digitos del 0 al 9 y termina. En caso contrario devuelve 1
}

SEGUIR=0
while [ "$SEGUIR" -eq "0" ]; do
    clear
    printf "CALCULO DEL VALOR DOBLE DE UN NUMERO\n"
    # Recuerde que en las expresiones aritmeticas, las cadenas de caracteres
    # son interpretadas como el valor "0"
    printf "Introduzca un número entero: "
    read num
    if [ -z "$num" ]; then
        printf "No ha introducido ningún valor\n"
    elif ! comprueba_entero "$num"; then
	printf "El valor introducido no es un número entero\n"
    else
        printf "2 * %d = %d\n" $num $((2*$num))
    fi
    printf "\nSi desea calcular otro doble, escriba \"S\" [N]: "
    read RESP
    if [ "$RESP" != "S" -a "$RESP" != "s" ]; then
       SEGUIR=1
    fi
done
