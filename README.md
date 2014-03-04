android-kernel-build-tools
==========================

To build your kernel you need to have a file in the top level
directory that contains the following configuration variables
(with the defaults that I use to build my dna kernel as an
example) Use the config-builder.py script to help create the file:

CROSS_COMPILE=~/path/to/toolchain/linaro-4.x.x/bin/arm-eabi-

HOST_CC=gcc

LOCAL_BUILD_DIR=~/path/to/kernel/source

TARGET_DIR=~/path/to/output/dir

SYSTEM_PARTITION="/dev/block/mmcblk0pXX"

DEFCONFIG=device_defconfig

FLASH_BOOT='write_raw_image("/tmp/boot.img", "boot")'

N_CORES=4

VERSION=


The file is named "kerneltools-build-config"

To use the "config-builder.py" Script

Change dir to the build tools and run: 

"chmod a+x config-builder.py"

"./config-builder.py"


In the LOCAL_BUILD_DIR you must have the following files:

initrd.img
bootimg.cfg
