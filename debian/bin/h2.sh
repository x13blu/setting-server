#!/bin/bash

CONFIG_FILE="config.sh"
DIR_LIBS="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib"

if [ -f "$DIR_LIBS/$CONFIG_FILE" ] ; then
  source "$DIR_LIBS/$CONFIG_FILE"
else
  echo "Falta archivo base"
  return
fi

if [ ! -n $IP_H2 ] ; then
  echo "Falta la clave IP_H2"
  return
fi

if [ ${#PORTS_H2[@]} -ne 2 ]; then
  echo "Numero de puertos incorrectos"
  return
fi

if [ ${#VOLUMES_H2[@]} -ne 1 ]; then
  echo "Numero de volumenes incorrectos"
  return
fi

sudo docker run \
--detach \
--restart always \
--name $CONTAINER_NAME_H2 \
--network $NETWORK \
--ip $IP_H2 \
--publish "${PORTS_H2[0]}:8082" \
--publish "${PORTS_H2[1]}:9092" \
--volume "${VOLUMES_H2[0]}:/opt/h2-data/" \
x13blu/h2-setting

#exec bash -l
