#!/usr/bin/env bash

set -e

echo "ECS_CLUSTER=${ECS_CLUSTER}" > /etc/ecs/ecs.config

if [ $DOCKER_NETWORK_MODE = "host" ]
then
  sudo sed -i -e "s|^(OPTIONS=\".*)\"$|\1 --bridge=none --ip-forward=false --ip-mask=false --iptables=false\"|" \
    /etc/sysconfig/docker
fi

sudo service docker stop

sudo rm -rf /var/lib/docker/network

sudo ip link del docker0 || true
