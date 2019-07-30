#!/bin/bash

set -e

BUILDROOT=/root/buildroot-2019.05.1
BUILDROOT_BUILD=/root/bt

if [[ -d $BUILDROOT_BUILD ]] ; then
	echo "del $BUILDROOT_BUILD"
	rm -rf $BUILDROOT_BUILD
fi


mkdir -p $BUILDROOT_BUILD

cd $BUILDROOT_BUILD
touch Config.in external.mk
echo 'name: mini_linux' > external.desc
echo 'desc: minimal linux system with buildroot' >> external.desc
mkdir configs overlay

cd $BUILDROOT
#make O=$BUILDROOT_BUILD BR2_EXTERNAL=$BUILDROOT_BUILD qemu_x86_64_defconfig
#make O=$BUILDROOT_BUILD BR2_EXTERNAL=$BUILDROOT_BUILD imx6ulevk_defconfig
#make O=$BUILDROOT_BUILD BR2_EXTERNAL=$BUILDROOT_BUILD at91sam9x5ek_defconfig
#make O=$BUILDROOT_BUILD BR2_EXTERNAL=$BUILDROOT_BUILD raspberrypi3_64_defconfig
make O=$BUILDROOT_BUILD BR2_EXTERNAL=$BUILDROOT_BUILD beaglebone_defconfig




cd $BUILDROOT_BUILD

make menuconfig

