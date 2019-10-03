# Script que muestra todos los ficheros ejecutables
# que hay en el PATH
# Funcion que lista los ejecutables de un directorio
function ListaEjecutables
{
IFS='
'
	ficheros=$(ls -1 $1)
	for fichero in $ficheros
		do
		path_fichero="$1/$fichero"
			if [ -x $path_fichero ]; then
				echo $path_fichero
			fi
		done
	IFS=':'
}
IFS=':'
for dir in $PATH
	do
		if [ -z "$dir" ]; then
			echo "ENCONTRADO UN DIRECTORIO VACIO"
				exit 1
		elif ! [ -d "$dir" ]; then
			echo "$dir NO ES UN DIRECTORIO VALIDO"
			exit 1
		else
			ListaEjecutables $dir
		fi
done
