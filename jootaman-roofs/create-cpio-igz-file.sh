#!/bin/bash

set -e

cd initramfs

find . | cpio -H newc -o > ../initramfs.cpio

cd ..

cat initramfs.cpio | gzip > initramfs.igz

exit 0
