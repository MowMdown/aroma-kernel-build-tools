#!/sbin/sh
#sweep2wake.sh by show-p1984
#Features: 
#set scheduler. script inspired by freak

##Get governor from aroma tmp
val=$(cat /tmp/aroma-data/scheduler.prop | cut -d"=" -f2)
case $val in
  1)
    scheduler="deadline"
    ;;
  2)
    scheduler="noop"
    ;;
  3)
    scheduler="cfq"
    ;;
  4)
    scheduler="sio"
    ;;
  5)
    scheduler="ROW"
    ;;
  6)
    scheduler="fiops"
    ;;
  7)
    scheduler="bfq"
    ;;
  
esac

#Add scheduler to the kernels cmdline.
cmdline=$(cat /tmp/boot.img-cmdline)
searchString="scheduler="
scheduler="scheduler="$scheduler
case $cmdline in
  "$searchString"* | *" $searchString"*)
   	echo $(cat /tmp/boot.img-cmdline | sed -e 's/scheduler=[^ ]\+//')>/tmp/boot.img-cmdline
	echo $(cat /tmp/boot.img-cmdline)\ $scheduler>/tmp/boot.img-cmdline
	;;  
  *)
	echo $(cat /tmp/boot.img-cmdline)\ $scheduler>/tmp/boot.img-cmdline
	;;
esac
#end scheduler

