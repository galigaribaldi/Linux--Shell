#!/bin/sh
case $1 in
  archivo | file)
    echo Archivo ;;
  *.c)
    echo Fichero C ;;
  *)
    echo Error
    echo Pruebe otro ;;
esac 
