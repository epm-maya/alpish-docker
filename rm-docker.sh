#!/bin/sh
set -ex

dockerctl stop

ls -l /usr/local/sbin
ls -l /usr/local/bin
ls -l /usr/local/libexec/docker/cli-plugins

rm -rf /usr/local/sbin
rm -rf /usr/local/bin
rm -rf /usr/local/libexec

echo "DONE"
