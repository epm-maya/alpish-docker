#!/bin/sh
set -ex

DOCKERVER='19.03.8'

echo "get (docker-${DOCKERVER})"

install -D -m 755 docker.sh /usr/local/sbin/dockerctl

mkdir -p /usr/local/bin

curl -fLo docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVER}.tgz"
tar xzf docker.tgz
mv docker/* /usr/local/bin/
rm -rf docker
rm docker.tgz

echo "DONE"
