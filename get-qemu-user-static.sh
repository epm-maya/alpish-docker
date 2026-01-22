#!/bin/sh
set -eux

QEMUVER='10.2.0-1'

echo "get (qemu-user-${QEMUVER})"

cd `dirname $0`

mkdir -p /usr/local/bin

curl -fLO https://github.com/epm-maya/qemu-user-arm/releases/download/v${QEMUVER}/qemu-user-arm.tar.gz
curl -fL  https://github.com/epm-maya/qemu-user-arm/releases/download/v${QEMUVER}/qemu-user-arm.tar.gz.sha256 | sha256sum -c -

tar xz -C / --strip-components=1 -f qemu-user-arm.tar.gz

echo "DONE"
