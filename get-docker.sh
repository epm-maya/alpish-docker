#!/bin/sh
set -ex

DOCKERVER='19.03.11'
COMPOSEVER='1.26.0'

echo "get (docker-${DOCKERVER}) (compose-${COMPOSEVER})"

cd `dirname $0`

install -D -m 755 docker.sh /usr/local/sbin/dockerctl

mkdir -p /usr/local/bin

curl -fLo docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVER}.tgz"
tar xzf docker.tgz
mv docker/* /usr/local/bin/
rm -rf docker
rm docker.tgz

curl -fLO "https://github.com/docker/compose/releases/download/${COMPOSEVER}/docker-compose-Linux-x86_64"
curl -fsL "https://github.com/docker/compose/releases/download/${COMPOSEVER}/docker-compose-Linux-x86_64.sha256" | sha256sum -c -

mv docker-compose-Linux-x86_64 docker-compose
chmod +x docker-compose
mv docker-compose /usr/local/bin/

echo "DONE"
