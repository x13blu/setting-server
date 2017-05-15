#!/bin/sh

#Global
IP_HOST="192.168.1.228"
NETWORK="setting-network"
HOSTNAME="gitlab.ejemplo.dev"

#Ip gitlab-ce container
IP_GITLAB="172.13.1.5"
CONTAINER_NAME_GITLAB="gitlab-container"
PORTS_GITLAB=("443" "80" "2222")
VOLUMES_GITLAB=("/srv/gitlab/config" "/srv/gitlab/logs" "/srv/gitlab/data")

#Ip gotlab-ci-runner container
IP_RUNNER="172.13.1.10"
CONTAINER_NAME_RUNNER="runner-container"
VOLUMES_RUNNER=("/srv/gitlab-runner/config" "/srv/gitlab-runner/data" "/var/run/docker.sock")

#Ip h2 database container
IP_H2="172.13.1.20"
CONTAINER_NAME_H2="h2-container"
PORTS_H2=("8082" "9092")
VOLUMES_H2=("/srv/h2/data")

#Ip wildfly container
IP_WILDFLY="172.13.1.30"
CONTAINER_NAME_WILDFLY="wildfly-container"
PORTS_WLDFLY=("8080" "9990")
VOLUMES_WILDFLY=("/srv/wildfly/deployments" "/srv/wildfly/configuration")
