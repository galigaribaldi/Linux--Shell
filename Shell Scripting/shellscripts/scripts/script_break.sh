#!/bin/sh
CONTADOR=0
while [ true ]; do
  until [ $CONTADOR -ge 5 ]; do
    echo El contador es $CONTADOR
    CONTADOR=$(($CONTADOR+1))
    break 2
    echo "Nunca llegar a interpretarse";
  done
done