#/bin/bash
###Ejecutar con permisos de superusuario
figlet "Compresora"
if [ $(whoami) != "root" ]; then
	echo "Necesitas ejecutar rsto con permisos de super usuario >:v"
	exit 1
fi
###Script mamalon
echo "¿Que desea hacer?"
echo -e "1.-Listar los archivos en el directorio\n2.-Elegir un archivo a comprimir\n3.- Elegir varios archivos para comprimir\n4.-Salir"
read numero
case $numero in
	1)
		echo -e "¿Quiere listar todos los archivos?\nIncluyendo los ocultos?"
		read res
		if test "$res" = "si"
			then
				ls -la
			else
				ls
		fi;;
	2)
		echo "Que archivo quiere elegir"
		read archivo
		extension=".tar"
		ar=$archivo$extension
		tar cvf $ar $archivo;;
	3)
		echo "¿Cuantos archivos quiere ingresar?"
		read numero
		espacio=" "
		lista=""
		for i in $(seq 1 $numero); do
			echo "ingrese el nombre del archivo" $i
			read nombre
			lista=$lista$espacio$nombre
		done
		echo -e "Los archivos a comprimir son: \n$lista";;
	4)
		exit;;
esac
