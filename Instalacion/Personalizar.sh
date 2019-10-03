###Hora
"echo -n [$(date +%H:%M:%S)]" ##Fecha entre corchetes :v
### el "-n" es para el retorno de carro osea para la fecha antes

PS1="[\D(%H:%M:%S)][\!][\#][\u@@\h]"
"[\W]" ##ruta
"\$"
####Fecha, Ruta, numero-comando
####Nombre

##colores:
 \[\033[1;36m\]
"\[\033[1;31m\][\D{%H:%M:%S}]" ##Rojo claro "Hora"
""
#Numero de comando Relativo y total ambas en morado#
PS1="\[\033[1;35m\][CR=\#]-[CA=\!]"

##Fecha con Ruta Rojo y blanco
PS1="\[\033[1;31m\][\D{%H:%M:%S}]\[\033[1;37m[\w]"
####Hibrido ##Fecha -Ruta -Numero de comando
PS1="\[\033[1;31m\][\D{%H:%M:%S}]\[\033[1;37m[\w]\033[1;35m\][CR=\#]-[CA=\!]$echo \n"

##Usuario y Computadora con azul
PS1="\[\033[1;34m\][\u >:v \h]"
####Completo 1ra Línea Fecha-Ruta-Comando
############ 2da Línea Usuario Computadora
########### 3ra Linea ->>
PS1="\[\033[1;31m\][\D{%H:%M:%S}]\033[1;35m\][CR=\#]-[CA=\!]$echo \n\[\033[1;34m\][\u >:v \h]$echo\n\[\033[1;32m\]>>"

PS1="\[\033[1;31m\][\D{%H:%M:%S}]\[\033[1;37m[\w]\033[1;35m\][CR=\#]-[CA=\!]\[\033[1;36m\][\u >:v \h]$echo\n \[\033[1;37m[\w]\[\033[1;32m\]>>"


######################################## 1 linea
PS1="\[\033[1;31m\][\D{%H:%M:%S}]\[\033[1;37m[\w]\033[1;35m\][CR=\#]-[CA=\!]\[\033[1;36m\][\u >:v \h]\[\033[1;37m[\w] $echo\n\[\033[1;32m\]>>"
#######################################

#### 2 lineas
PS1="\[\033[1;31m\][\D{%H:%M:%S}]\[\033[1;37m[\w]\033[1;35m\][CR=\#]-[CA=\!]\[\033[1;36m\][\u >:v \h]$echo\n\[\033[1;37m[\w]\033[1;35m\][CR=\#]-[CA=\!] \[\033[1;32m\]>>"

##############################33

PS1="\[\033[1;31m\][\D{%H:%M:%S}]m[\w]\033[1;35m\][CR=\#]-[CA=\!]\[\033[1;36m\][\u >:v \h]$echo\n\[\033[1;37m[\w]\033[1;32m\]>>"





PS1="\[\033[1;31m\][\D{%H:%M:%S}]\[\033[1;37m[\w]\033[1;35m\][CR=\#]-[CA=\!]\[\033[1;36m\][\u >:v \h] $echo\n\[\033[1;37m[\w]\[\033[1;32m\]>>"



############33Final
PS1="\[\033[1;31m\][\D{%H:%M:%S}]\[\033[1;36m\][\u >:v \h]$echo\n\[\033[1;37m[\w]\033[1;37;35m\][CR=\#]-[CA=\!] \[\033[1;32m\]>>"
