#!/bin/sh
set -ex

dockerctl stop

ls -l /usr/local/sbin
ls -l /usr/local/bin

rm -rf /usr/local/sbin
rm -rf /usr/local/bin

echo "DONE"
