#!/bin/bash

set -e

#export OPT=/opt
export BUILDS=/some/where/mini_linux
export INITRAMFS_BUILD=$BUILDS/initramfs

mkdir -p $BUILDS

mkdir -p $INITRAMFS_BUILD

cd $INITRAMFS_BUILD

mkdir -p bin sbin etc proc sys usr/bin usr/sbin

cp -a $BUSYBOX_BUILD/_install/* .

chmod +x init

find . -print0 | cpio --null -ov --format=newc \
  | gzip -9 > $BUILDS/initramfs.cpio.gz


