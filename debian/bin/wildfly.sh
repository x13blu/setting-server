#!/bin/bash

CONFIG_FILE="config.sh"
DIR_LIBS="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib"

if [ -f "$DIR_LIBS/$CONFIG_FILE" ] ; then
  source "$DIR_LIBS/$CONFIG_FILE"
else
  echo "Falta archivo base"
  return
fi

if [ ! -n $IP_WILDFLY ] ; then
  echo "Falta la clave IP_WILDFLY"
  return
fi

if [ ${#PORTS_WLDFLY[@]} -ne 2 ]; then
  echo "Numero de puertos incorrectos"
  return
fi

if [ ${#VOLUMES_WILDFLY[@]} -ne 2 ]; then
  echo "Numero de volumenes incorrectos"
  return
fi

sudo docker run \
--detach \
--restart always \
--name $CONTAINER_NAME_WILDFLY \
--network $NETWORK \
--ip $IP_WILDFLY \
--publish "${PORTS_WLDFLY[0]}:8080" \
--publish "${PORTS_WLDFLY[1]}:9990" \
--volume "${VOLUMES_WILDFLY[0]}:/opt/jboss/wildfly/standalone/deployments/:rw" \
--volume "${VOLUMES_WILDFLY[1]}:/opt/jboss/wildfly/standalone/configuration/:rw" \
--add-host "$HOSTNAME:$IP_H2" \
x13blu/wildfly-setting

#exec bash -l
