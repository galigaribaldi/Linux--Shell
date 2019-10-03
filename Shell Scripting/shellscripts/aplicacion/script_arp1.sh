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

        # Solucion A basada en estructuras de control
        LIN=0
        /usr/sbin/arp -n | while read linea ; do
            LIN=$((LIN+1))
            [ $LIN -eq $(($NARP+1)) ] && { 
		        echo "Entrada \"$NARP\" de la cache: "
                echo "$linea"; }
        done

    fi
else
    echo "Posicion de entrada ARP no valida"
fi
