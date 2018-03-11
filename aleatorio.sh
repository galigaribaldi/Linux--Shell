let intentos=10
let solucion=$RANDOM%100
while ((intentos
--
>0))
do
  read -p "Indique un numero:" numero
  if ((numero==solucion)); then
     echo "ACERTASTE ERA $solucion, ENHORABUENA!"
     exit
  elif ((numero<solucion)); then
     echo "Es mayor"
  else
     echo "Es menor"
  fi
done
echo "PERDISTE POR SUPERAR LOS 10 INTENTOS"
