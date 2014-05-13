#!/sbin/sh
#Features:
#clean cmdline of foreigns in case of something wicked is going on in there
#(supports my kernel edits, so that the kernel boots with that values)

#clean cmdline from foreigns. failsafe
#needed since some cmdlines are full of rubbish :)
sed -i 's/user_debug=31[^$]*$/user_debug=31/g' /tmp/boot.img-cmdline