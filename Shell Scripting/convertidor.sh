##Conveirte un .bmp a un .jpg
###operadores ternarios
fichero_entrada=${1:?'Falta Argumento'}
fichero_intermedio=${fichero_entrada%.bmp}.ppm
fichero_salida=${2:-${fichero_intermedio%.ppm}.jpg}

bmptoppm $fichero_entrada > $fichero_intermedio
ppmtojpeg $fichero_intermedio > $fichero_salida

