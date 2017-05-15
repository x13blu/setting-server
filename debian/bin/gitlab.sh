#!/bin/sh

CONFIG_FILE="config.sh"
DIR_LIBS="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib"

if [ -f "$DIR_LIBS/$CONFIG_FILE" ] ; then
  source "$DIR_LIBS/$CONFIG_FILE"
else
  echo "Falta archivo base"
  return
fi

if [ ! -n $IP_GITLAB ] ; then
  echo "Falta la clave IP_GITLAB"
  return
fi

if [ ${#PORTS_GITLAB[@]} -ne 3 ]; then
  echo "Numero de puertos incorrectos"
  return
fi

if [ ${#VOLUMES_GITLAB[@]} -ne 3 ]; then
  echo "Numero de volumenes incorrectos"
  return
fi

sudo docker run \
--detach \
--restart always \
--hostname $HOSTNAME \
--name $CONTAINER_NAME_GITLAB \
--network $NETWORK \
--ip $IP_GITLAB \
--publish "${PORTS_GITLAB[0]}:443" \
--publish "${PORTS_GITLAB[1]}:80" \
--publish "${PORTS_GITLAB[2]}:22" \
--volume "${VOLUMES_GITLAB[0]}:/etc/gitlab/:rw" \
--volume "${VOLUMES_GITLAB[1]}:/var/log/gitlab/:rw" \
--volume "${VOLUMES_GITLAB[2]}:/var/opt/gitlab/:rw" \
x13blu/gitlab-ce-setting

#exec bash -l
