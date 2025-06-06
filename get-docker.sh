#!/bin/sh
set -eux

DOCKERVER='28.2.2'
BUILDXVER='0.24.0'
COMPOSEVER='2.37.0'

echo "get (docker-${DOCKERVER})"

cd `dirname $0`

install -D -m 755 docker.sh /usr/local/sbin/dockerctl

mkdir -p /usr/local/bin

curl -fLo docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVER}.tgz"
tar xzf docker.tgz
mv docker/* /usr/local/bin/
rm -rf docker
rm docker.tgz

curl -fLo docker-buildx https://github.com/docker/buildx/releases/download/v${BUILDXVER}/buildx-v${BUILDXVER}.linux-amd64
curl -fLo docker-compose https://github.com/docker/compose/releases/download/v${COMPOSEVER}/docker-compose-linux-x86_64
chmod +x docker-*

mkdir -p /usr/local/libexec/docker/cli-plugins
mv docker-* /usr/local/libexec/docker/cli-plugins/

echo "DONE"
