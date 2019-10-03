#!/bin/bash
########################################################################
#     $# -> recibe argumentos desde correrlo
echo "El script $0 recibe $# argumentos: "
echo "El Script $0 Recibe $# Argumentos: "
######################################################################
function crear
{
mkdir nuevo_directorio
touch 3
cowsay hola >> hola.txt
}
##################################################################3########
function intro
{
echo -n "palabra 1: "
read palabra
echo -n "Palabra 2: "
read palabra2
echo -n "La palabra 1 es: $palabra"
echo  "La palabra 2 es: $palabra2"
}
########################################################################3
function var
{
var1=5
var2=4
resultado=$var1*$var2
echo "$resultado"
}
var

fucntion var_entero
{
declare -i var1=5
declare -i var2=4
declare -i resultado
resultado=$var1*$var2
echo $resultado
}
#####uso de las llaves
nombre="Roberto"
apellido="Robato"
echo "$nombre $apellido"


