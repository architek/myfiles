#!/bin/bash
id=`identify "$1"`
newname=${1/.jpg/-new.jpg}
echo $newname
maxw=1280
maxh=1024
maxw=1024
maxh=768
res=`echo $id | sed 's/.*\ \([0-9]*x[0-9]*\).*/\1/'`
w=`echo $res | sed 's/x.*//'`
h=`echo $res | sed 's/.*x//'`
if [ $w -gt $h ] ; then
	#Width is bigger than Height, Our maximum is given by Width
	#R=Height/Width
	r=`echo "scale=3;$h/$w;" | bc -q`
	#Width is MaxW, Height=MaxW*Height/Width=MaxW*R
	nh=`echo "scale=0;$maxw*$r" | bc -q`
	nw=$maxw
	echo "Image $1 detected as width:$w, height:$h - Landscape: Ratio is $r, new dimensions: width=$nw, height=$nh"
else
	#R=Width/Height
	r=`echo "scale=3;$w/$h;" | bc -q`
	#Width is MaxH, Width=MaxH*Width/Height=MaxH*R
	nw=`echo "scale=0;$maxh*$r" | bc -q`
	nh=$maxh
	echo "Image $1 detected as width:$w, height:$h - Portrait: Ratio is $r, new dimensions: width=$nw, height=$nh"
fi
convert "${1}" -geometry "${nw}x${nh}" -interlace Line ${newname}
