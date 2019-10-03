#!/bin/sh

# FAST: Funciones importadas desde el script "script1.sh"

IFACE="eth0"
DIR="/sbin"
DIR_USR="/usr/sbin"

arranque_red()
{
  echo "Reactivando la interfaz ${IFACE}..."
  ${DIR}/ifdown ${IFACE}
  ${DIR}/ifup ${IFACE}
  echo "Pulse intro para continuar..."
  read REPLY
}


parada_red()
{
  echo "Desactivando la interfaz ${IFACE}..."
  ${DIR}/ifdown ${IFACE}
  echo "Pulse intro para continuar..."
  read REPLY
}


estado_red()
{
  echo "Estado de la configuración actual de la red"
  echo "Configuración de la red (comando \"ifconfig $1\"):"
  ${DIR}/ifconfig $1
  echo
  echo
  echo "Pulse intro para continuar..."
  read REPLY
  echo "Tabla ARP (comando \"arp $2\"):"
  ${DIR_USR}/arp $2
  echo
  echo
  echo "Pulse intro para continuar..."
  read REPLY
  echo "Tabla de Encaminamiento (comando \"route $3\"):"
  ${DIR}/route $3
  echo
  echo
  echo "Pulse intro para continuar..."
  read REPLY
}
