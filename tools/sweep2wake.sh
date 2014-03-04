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
    #on but no button backlight
    s2w="1"
    sweep2wakeon
    ;;
  3)
    #on with backlight
    s2w="2"
    sweep2wakeon
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

#Add s2w to the kernels cmdline.
val=$(cat /tmp/aroma-data/sweep_start.prop | cut -d"=" -f2)
case $val in
  1)
    s2w_start="BACK"
    ;;
  2)
    s2w_start="HOME"
    ;;
  3)
    s2w_start="MENU"
    ;;
esac

val=$(cat /tmp/aroma-data/sweep_end.prop | cut -d"=" -f2)
case $val in
  1)
    s2w_end="BACK"
    ;;
  2)
    s2w_end="HOME"
    ;;
  3)
    s2w_end="MENU"
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

cmdline=$(cat /tmp/boot.img-cmdline)
searchString="s2w_start="
s2w_start="s2w_start="$s2w_start
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/s2w_start=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $s2w_start>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $s2w_start>/tmp/boot.img-cmdline
	;;
esac

cmdline=$(cat /tmp/boot.img-cmdline)
searchString="s2w_end="
s2w_end="s2w_end="$s2w_end
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/s2w_end=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $s2w_end>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $s2w_end>/tmp/boot.img-cmdline
	;;
esac


