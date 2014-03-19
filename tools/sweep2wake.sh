#!/sbin/sh

#get sweep2wake setting
val=$(cat /tmp/aroma-data/sweep.prop | cut -d"=" -f2)
case $val in
  1)
    #enabled
    s2w="1"
    sweep2wakeoff
    ;;
  2)
    #disabled
    s2w="0"
    sweep2wakeon
    ;;
esac

#get sweep2sleep only setting
val=$(cat /tmp/aroma-data/sweepoff.prop | cut -d"=" -f2)
case $val in
  1)
    #enabled
    s2sonly="1"
    sweep2sleeponlyoff
    ;;
  2)
    #disabled
    s2sonly="0"
    sweep2sleeponlyon
    ;;
esac

#get doubletap2wake setting
val=$(cat /tmp/aroma-data/tap.prop | cut -d"=" -f2)
case $val in
  1)
    #enabled
    dt2w="1"
    tap2wakeon
    ;;
  2)
    #disabled
    dt2w="0"
    tap2wakeoff
    ;;
esac

#get pocket_detect setting
val=$(cat /tmp/aroma-data/pd.prop | cut -d"=" -f2)
case $val in
  1)
    #enabled
    pd="1"
    pocketdetecton
    ;;
  2)
    #disabled
    pd="0"
    pocketdetectoff
    ;;
esac

#get blink_buttons setting
val=$(cat /tmp/aroma-data/blink.prop | cut -d"=" -f2)
case $val in
  1)
    #enabled
    blink_buttons="1"
    blinkbuttonson
    ;;
  2)
    #disabled
    blink_buttons="0"
    blinkbuttonsoff
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
searchString="s2sonly="
s2sonly="s2sonly="$s2sonly
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/s2sonly=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $s2sonly>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $s2sonly>/tmp/boot.img-cmdline
	;;
esac
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="dt2w="
dt2w="dt2w="$dt2w
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/dt2w=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $dt2w>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $dt2w>/tmp/boot.img-cmdline
	;;
esac
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="pd="
pd="pd="$pd
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/pd=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $pd>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $pd>/tmp/boot.img-cmdline
	;;
esac
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="blink_buttons="
blink_buttons="blink_buttons="$blink_buttons
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/blink_buttons=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $blink_buttons>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $blink_buttons>/tmp/boot.img-cmdline
	;;
esac