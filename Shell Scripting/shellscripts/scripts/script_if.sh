#!/bin/sh
FILE=/tmp/archivo
if [ -r $FILE -a ! -w $FILE ]; then
  echo Fichero $FILE existe y no es modificable
else
  echo Fichero no encontrado o es modificable
fi
VAR1=1; VAR2=1
if [ $(($VAR1)) -ne $(($VAR2)) ]; then
  echo Distintos
elif ls /; then
 :
fi
