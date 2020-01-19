#!/usr/bin/env bash

set -e

packages="awslogs jq aws-cfn-bootstrap"

sudo yum -y -x docker\* -x ecs\* update

echo "### Installing extract packages: $packages ###"

sudo yum -y install $packages
