#!/bin/sh
#
# m4a to mp3

trap 'rm -f "$info" "$opts" "$wav" "$mp3"; exit 10' 1 2 3 15

quality=5
bitrate=192

for m4a in "$@"; do
 info=` echo "$m4a"|sed -n 's/\.m4a$/.info/p'`
 opts=` echo "$m4a"|sed -n 's/\.m4a$/.opts/p'`
 wav=`  echo "$m4a"|sed -n 's/\.m4a$/.wav/p'`
 mp3=`  echo "$m4a"|sed -n 's/\.m4a$/.mp3/p'`
 [ -z "$mp3" ] && continue

 # study it
 faad -i "$m4a" 2>"$info"  #faad outputs info to stderr!
 cat "$info" | sed -n '
   s/["`$]/\\\&/g   # handle any escapes in titles
   s/^title: \(.*\)$/--tt "\1"/p
   s/^artist: \(.*\)$/--ta "\1"/p
   s/^album: \(.*\)$/--tl "\1"/p
   s/^track: \(.*\)$/--tn "\1"/p
   s/^date: \([12][0-9][0-9][0-9]\)$/--ty "\1"/p  # year?
  #s/^genre: \(.*\)$/--tg "\1"/p   # m4a genres dont match those of mp3
  ' - > "$opts"

 # convert it
 faad "$m4a"
 eval "lame -q $quality -b $bitrate "`cat "$opts"`" \"$wav\" \"$mp3\""

 # cleanup
 rm -f "$opts" "$wav" "$info"
done
