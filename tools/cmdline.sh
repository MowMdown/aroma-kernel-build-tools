#!/sbin/sh
#Features: 
#maxkhz/minkhz added to the kernels cmdline
#clean cmdline of foreigns in case of something wicked is going on in there
#(supports my kernel edits, so that the kernel boots with that values)

##Get CPU MAXCLOCK from aroma tmp
val=$(cat /tmp/aroma-data/maxkhz.prop | cut -d"=" -f2)
case $val in
  1)
    maxkhz="1512000"
    ;;
  2)
    maxkhz="1674000"
    ;;
  3)
    maxkhz="1728000"
    ;;
esac
##end Get cpu maxclock from aroma tmp

##Get CPU MINCLOCK from aroma tmp
val=$(cat /tmp/aroma-data/minkhz.prop | cut -d"=" -f2)
case $val in
  1)
    minkhz="162000"
    ;;
  2)
    minkhz="270000"
    ;;
  3)
    minkhz="378000"
    ;;
  4)
    minkhz="384000"
    ;;
  5)
    minkhz="486000"
    ;;
esac
##end Get cpu minclock from aroma tmp

#clean cmdline from foreigns. failsafe
#needed since some cmdlines are full of rubbish :)
sed -i 's/user_debug=31[^$]*$/user_debug=31/g' /tmp/boot.img-cmdline

#Add maxkhz to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="maxkhz="
maxkhz="maxkhz="$maxkhz
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/maxkhz=[^ ]\+//')>/tmp/boot.img-cmdline
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
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/minkhz=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $minkhz>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $minkhz>/tmp/boot.img-cmdline
	;;
esac
#end minkhz
