#!/bin/bash

set -e

DIR=initramfs

if [[ $1 = "clean" ]]; then
#    echo "$1"
    echo "clean the project"
    rm -rf initramfs*
    exit 0;
fi

if [[ -d $DIR ]]; then
    echo "delete $DIR ....."
    rm -rf $DIR
fi

mkdir -p $DIR/{bin,sbin,etc,proc,sys,newroot}

touch $DIR/etc/mdev.conf

#bunzip2 res/busybox-1.10.1-static.bz2 > initramfs/bin/busybox $$

#cp res/busybox-1.10.1-static $DIR/bin/busybox $$
cp res/busybox-1.10.1-static $DIR/bin/busybox 

cp res/init $DIR/init

chmod +x $DIR/bin/busybox

chmod +x $DIR/init

ln -s busybox $DIR/bin/sh

cd $DIR

find . | cpio -H newc -o > ../initramfs.cpio

cd -

cat initramfs.cpio | gzip > initramfs.igz

gzip initramfs.cpio

exit 0


