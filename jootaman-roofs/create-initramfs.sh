#!/bin/bash

set -e

mkdir -p initramfs/{bin,sbin,etc,proc,sys,newroot}

cd work

touch initramfs/etc/mdev.conf

exit 0


