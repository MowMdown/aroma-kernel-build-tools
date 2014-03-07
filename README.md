Setup kerneltools-build-config
=============================

To build your kernel you need to have a file in the top level
directory that contains the following configuration variables
(with the defaults that I use to build my dna kernel as an
example) Use the config-builder.py script to help create the file:

CROSS_COMPILE=~/path/to/toolchain/linaro-4.x.x/bin/arm-eabi-

HOST_CC=gcc

LOCAL_BUILD_DIR=directory_containing_source

TARGET_DIR=~/path/to/output/dir

SYSTEM_PARTITION="/dev/block/mmcblk0pXX"

DEFCONFIG=device_defconfig

FLASH_BOOT='write_raw_image("/tmp/boot.img", "boot")'

N_CORES=4

VERSION=**YOUR_KERNEL_VERSION_HERE**

The file is named "kerneltools-build-config"

To use the "config-builder.py" Script

Change dir to the build tools and run: 

"chmod a+x config-builder.py"

"./config-builder.py"


In the LOCAL_BUILD_DIR you must have the following files:

initrd.img
bootimg.cfg

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

Using Anykernel-build-tools
===========================
Use the anykernelbuild.sh

This will build a standard kernel with a non-aroma installer zip, just flash and go!

To use this method, you will need to edit the contents of "anykernel-updater-script" < DO NOT RENAME THIS FILE!!!

Other
=====
If you wish to use any additional files, you can create a system directory inside the LOCAL_BUILD_DIR 
and store anything you wish to send to the system after mounting. 

Also if you wish to use a prebuild boot.img just add it to the root of the LOCAL_BUILD_DIR and it will use that to inject the zImage into it.
