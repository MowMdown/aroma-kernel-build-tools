#!/sbin/sh
#Features: 
#maxkhz/minkhz/gov/maxscroff added to the kernels cmdline
#clean cmdline of foreigns in case of something wicked is going on in there
#(supports my kernel edits, so that the kernel boots with that values)



##Get CPU MINCLOCK from aroma tmp
val=$(cat /tmp/aroma-data/minkhz.prop | cut -d"=" -f2)
case $val in
  1)
    minkhz="189000"
    ;;
  2)
    minkhz="384000"
    ;;
  3)
    minkhz="432000"
    ;;
esac
##end Get cpu minclock from aroma tmp

##Get CPU MAXCLOCK from aroma tmp
val=$(cat /tmp/aroma-data/maxkhz.prop | cut -d"=" -f2)
case $val in
  1)
    maxkhz="1512000"
    ;;
  2)
    maxkhz="1539000"
    ;;
  3)
    maxkhz="1674000"
    ;;
 4)
    maxkhz="1755000"
    ;;
 5)
    maxkhz="1782000"
    ;;
  6)
    maxkhz="1809000"
    ;;
  7)
    maxkhz="1836000"
    ;;
esac
##end Get cpu maxclock from aroma tmp

##Get 3dgpuoc from aroma tmp
val=$(cat /tmp/aroma-data/3dgpu.prop | cut -d"=" -f2)
case $val in
  1)
    gpu3d="533333000"
    ;;
  2)
    gpu3d="487500000"
    ;;
  3)
    gpu3d="400000000"
    ;;
  4)
    gpu3d="320000000"
    ;;
  5)
    gpu3d="266667000"
    ;;
esac
##end Get 3dgpuoc from aroma tmp

##Get 2dgpuoc from aroma tmp
val=$(cat /tmp/aroma-data/2dgpu.prop | cut -d"=" -f2)
case $val in
  1)
    gpu2d="300000000"
    ;;
  2)
    gpu2d="266667000"
    ;;
  3)
    gpu2d="200000000"
    ;;
esac
##end Get 2dgpuoc from aroma tmp


#clean cmdline from foreigns. failsafe
#needed since some cmdlines are full of rubbish :)
sed -i 's/no_console_suspend=1[^$]*$/no_console_suspend=1/g' /tmp/boot.img-cmdline

#Add maxkhz to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="maxkhz="
maxkhz="maxkhz="$maxkhz
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -re 's/maxkhz=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $maxkhz>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $maxkhz>/tmp/boot.img-cmdline
	;;
esac
#end maxkhz

#Add minkhz to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="minkhz="
minkhz="minkhz="$minkhz
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -re 's/minkhz=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $minkhz>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $minkhz>/tmp/boot.img-cmdline
	;;
esac
#end minkhz

#Add gov to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="gov="
gov="gov="$gov
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/gov=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $gov>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $gov>/tmp/boot.img-cmdline
	;;
esac
#end gov

#Add 3dgpu to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="3dgpu="
gpu3d="3dgpu="$gpu3d
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/3dgpu=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $gpu3d>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $gpu3d>/tmp/boot.img-cmdline
	;;
esac
#end 3dgpu

#Add 2dgpu to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="2dgpu="
gpu2d="2dgpu="$gpu2d
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/2dgpu=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $gpu2d>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $gpu2d>/tmp/boot.img-cmdline
	;;
esac

mv /system/bin/thermald /system/bin/thermald_old
mv /system/bin/mpdecision /system/bin/mpdecision_old

#end 2dgpu

