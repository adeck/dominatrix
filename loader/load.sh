#!/usr/bin/env bash

boot=trix.bootloader
drive=/dev/sdb

if [ $# -gt 0 ]
then
  TRIX_HOME="$1"
else
  TRIX_HOME="/home/enveloper/trix"
fi
head -c 510 /dev/zero > /dev/sdb
echo "### orig ###"
head -c 512 "$drive" | od -h
cat "$TRIX_HOME/bootloader/$boot" > /dev/sdb
echo "### loaded ###"
head -c 512 "$drive" | od -h
sync ; sync ; sync
sync ; sync ; sync
sync ; sync ; sync


