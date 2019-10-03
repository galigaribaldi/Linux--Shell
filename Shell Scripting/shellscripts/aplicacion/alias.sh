# FAST: Definición de "alias" en los scripts usados en la apertura de sesiones de usuarios

# En /etc/profile
alias red='ifconfig -a'

# En /home/dit/.bashrc
alias casa='echo $PWD'

# En /root/.bashrc
alias sockets='netstat -l'

# Funciones equivalentes:
#  Nota: no debe definir alias y nombres de funciones con el mismo nombre simultáneamente,
#     si intenta ejecutar este script dará error.

# En /etc/profile
red() { ifconfig -a; }

# En /home/dit/.bashrc
casa() { echo $PWD; }

# En /root/.bashrc
# $@ permite añadir los argumentos pasados a la función a netstat
sockets() { netstat -l $@; }

