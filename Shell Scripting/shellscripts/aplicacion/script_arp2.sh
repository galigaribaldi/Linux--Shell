#!/bin/sh

NARP=$1

if [ $NARP -ge 1 ] 2> /dev/null; then
    # Calculamos el numero de entradas de la Tabla ARP
    NENTRADAS=$(($(/usr/sbin/arp -n 2> /dev/null | wc -l)-1))

    if [ $NARP -gt $NENTRADAS ]; then
        echo "Ninguna entrada ARP en la posicion \"$NARP\""
    else
        # Si la entrada pedida existe, se imprime
        # La entrada "N" se encuentra en la linea "N+1" de la salida de arp

        # Solucion B basada en los comandos "head" y "tail"
        SAL=$(/usr/sbin/arp -n  2> /dev/null | head -n $(($NARP+1)) | tail -n 1)
        if ! [ -z "$SAL" ]; then
            echo "Entrada \"$NARP\" de la cache ARP:"
            echo "$SAL"
        else
            echo "Error"
        fi

    fi
else
    echo "Posicion de entrada ARP no valida"
fi
