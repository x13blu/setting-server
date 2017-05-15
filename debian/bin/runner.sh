#!/bin/sh

CONFIG_FILE="config.sh"
DIR_LIBS="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/lib"

if [ -f "$DIR_LIBS/$CONFIG_FILE" ] ; then
  source "$DIR_LIBS/$CONFIG_FILE"
else
  echo "Falta archivo base"
  return
fi

if [ ! -n $IP_RUNNER ] ; then
  echo "Falta la clave IP_RUNNER"
  return
fi

if [ ${#VOLUMES_RUNNER[@]} -ne 3 ]; then
  echo "Numero de volumenes incorrectos"
  return
fi

sudo docker run \
--detach \
--restart always \
--name $CONTAINER_NAME_RUNNER \
--network $NETWORK \
--ip $IP_RUNNER \
--volume "${VOLUMES_RUNNER[0]}:/etc/gitlab-runner" \
--volume "${VOLUMES_RUNNER[1]}:/home/gitlab-runner" \
--volume "${VOLUMES_RUNNER[2]}:/var/run/docker.sock" \
--add-host "$HOSTNAME:$IP_GITLAB" \
--add-host "$HOSTNAME:$IP_HOST" \
x13blu/gitlab-runner-setting

#exec bash -l
