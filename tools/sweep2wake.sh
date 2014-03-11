#!/sbin/sh


#get sweep2wake setting
val=$(cat /tmp/aroma-data/sweep.prop | cut -d"=" -f2)
case $val in
  1)
    #disabled
    s2w="0"
    sweep2wakeoff
    ;;
  2)
    #Sweep2Wake
    s2w="1"
    sweep2wakeon
    ;;
esac

#get sweep2sleep only setting
val=$(cat /tmp/aroma-data/sweepoff.prop | cut -d"=" -f2)
case $val in
  1)
    #disabled
    s2s="0"
    sweep2sleeponlyoff
    ;;
  2)
    #enabled
    s2s="1"
    sweep2sleeponlyon
    ;;
esac

#get doubletap2wake setting
val=$(cat /tmp/aroma-data/tap.prop | cut -d"=" -f2)
case $val in
  1)
    #disabled
    dt2w="0"
    tap2wakeoff
    ;;
  2)
    #enabled
    dt2w="1"
    tap2wakeon
    ;;
esac

cmdline=$(cat /tmp/boot.img-cmdline)
searchString="s2w="
s2w="s2w="$s2w
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/s2w=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $s2w>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $s2w>/tmp/boot.img-cmdline
	;;
esac
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="s2s="
s2s="s2s="$s2s
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/s2s=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $s2s>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $s2s>/tmp/boot.img-cmdline
	;;
esac
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="dt2w="
dt2w="dt2w="$dt2w
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/s2w=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $dt2w>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $dt2w>/tmp/boot.img-cmdline
	;;
esac
