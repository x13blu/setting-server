#!/bin/bash


echo $(tput setaf 3)Creando Gitlab-ce... $(tput sgr 0)
docker run \
--detach \
--name gitlab-ce-container \
--restart always \
--network setting-network \
--ip 172.13.1.10 \
--hostname setting.dev \
--publish 443:443 \
--publish 80:80 \
--publish 2022:22 \
--volume /srv/gitlab/config:/etc/gitlab \
--volume /srv/gitlab/logs:/var/log/gitlab \
--volume /srv/gitlab/data:/var/opt/gitlab \
x13blu/gitlab-ce-setting


echo $(tput setaf 3)Creando gitlab-runner... $(tput sgr 0)
docker run \
--detach \
--name gitlab-runner-container \
--restart always \
--network setting-network \
--ip 172.13.1.11 \
--add-host gitlab.ejemplo.dev:172.13.1.10 \
--volume /srv/gitlab-runner/data:/home/gitlab-runner/:rw \
--volume /var/run/docker.sock:/var/run/docker.sock \
x13blu/gitlab-runner-setting


echo $(tput setaf 3)Creando h2... $(tput sgr 0)
docker run \
--detach \
--name h2-container \
--restart always \
--network setting-network \
--ip 172.13.1.12 \
--publish 8082:8082 \
--publish 9092:9092 \
--volume /srv/h2/data:/opt/h2-data \
x13blu/h2-setting


echo $(tput setaf 3)Creando wildfly... $(tput sgr 0)
docker run \
--detach \
--name wildlfy-container \
--restart always \
--network setting-network \
--ip 172.13.1.13 \
--add-host gitlab.ejemplo.dev:172.13.1.12 \
--publish 8080:8080 \
--publish 9990:9990 \
--volume /srv/wildfly/deployments:/opt/jboss/wildfly/standalone/deployments/:rw \
--volume /srv/wildfly/configuration:/opt/jboss/wildfly/standalone/configuration/:rw \
x13blu/wildfly-setting
