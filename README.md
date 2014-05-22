Setup kerneltools-build-config
=============================

To build your kernel you need to have a file in the top level
directory that contains the following configuration variables
(with the defaults that I use to build my dna kernel as an
example) Use the config-builder.py script to help create the file:

CROSS_COMPILE=~/path/to/toolchain/linaro-4.x.x/bin/arm-eabi-

HOST_CC=gcc

LOCAL_BUILD_DIR=is a directory that you keep in the top level of the source

TARGET_DIR=~/path/to/output/dir

SYSTEM_PARTITION="/dev/block/mmcblk0p##"

BOOT_PARTITION="/dev/block/mmcblk0p##"

DEFCONFIG=device_defconfig

FLASH_BOOT='write_raw_image("/tmp/boot.img", "boot")' <-- Optional

N_CORES= # of jobs, this replaces "make -j4" command

VERSION=**YOUR_KERNEL_VERSION_HERE**

The file is named "kerneltools-build-config"


Using Aroma-kernel-build-tools
==============================
Use the aromakernelbuild.sh script to build with the aroma installer

To use this method, you will need to edit the contents of "aroma-updater-script" < DO NOT RENAME THIS FILE!!!

You will need to edit the "aroma-config" file to suit your needs < DO NOT RENAME THIS FILE!!!

and add your logo.png of choice to the aroma directory

You will need to store any tools that you want to use in the tools directory

This is where you can place tools that you want your aroma-config to use such as:

busybox
dd
abootimg
mkbootimg
unpackbootimg
and any other scripts that you want aroma to use


Other
=====
An example of a kerneltools-build-config for the DNA is included, edit the file to match your set-up and move it to the top level directory.

If you wish to use any additional files, you can create a system directory inside the LOCAL_BUILD_DIR 
and store anything you wish to send to the system after mounting. 

Also if you wish to use a prebuild boot.img just add it to the root of the LOCAL_BUILD_DIR and it will use that to inject the zImage into it. (No longer supported by aromakernelbuild.sh)

AromaKernelBuild.sh does not use the kernel directory or its contents, please refer to the tools directory for aroma kernel tools
