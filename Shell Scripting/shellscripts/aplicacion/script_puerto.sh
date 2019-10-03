#!/bin/sh


if [ $# -eq 1 ]; then
    PUERTO=$1
    COMANDO="/bin/netstat -t -l -n"

    if [ $PUERTO -ge 1 -a $PUERTO -le 1023 ]; then
        for p in $PUERTO $((PUERTO+1)); do
            $COMANDO 2> /dev/null | grep ":$p" > /dev/null 2>&1
            [ $? = 0 ] && ESTADO="a la escucha" || ESTADO="NO a la escucha"
            echo Puerto TCP local \"$p\" $ESTADO
        done
    else
        echo El puerto indicado no es del sistema
    fi
else
    echo Uso $0 PUERTO_TCP_ENTRE_1_Y_1023
fi
