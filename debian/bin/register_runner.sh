#!/bin/bash


echo Register docker runner...
gitlab-runner register -n \
  --url http://setting.dev/ci \
  --registration-token 9s8sydNoUMsW2Es2A4sw \
  --executor docker \
  --description "Docker Runner" \
  --docker-image "docker:latest" \
  --docker-privileged \
  --docker-extra-hosts setting.dev:192.168.0.167 \
  --tag-list docker


echo Register shell runner...
gitlab-runner register -n \
  --url http://gitlab.ejemplo.dev/ci \
  --registration-token 9s8sydNoUMsW2Es2A4sw \
  --executor shell\
  --description "Shell Runner" \
  --tag-list shell
