#!/bin/sh

IP_H2="172.13.1.20"
DOCKER_HUB_H2="x13blu/h2-setting"
CONTAINER_NAME_H2="h2-container"
NETWORK="setting-network"

sudo docker build -t $DOCKER_HUB_H2 .

echo sudo docker run \
--detach \
--restart always \
--name $CONTAINER_NAME_H2 \
--network $NETWORK \
--ip $IP_H2 \
--publish 8082:8082 \
--publish 9092:9092 \
--volume /srv/h2/data:/opt/h2-data/ \
x13blu/h2-setting
