#!/bin/bash
q=${2:-90}
[[ $q == 0 ]] && q=90
a=`mktemp`
convert -quality $q "$1" $a.jpg
[[ $? != 0 ]] && { echo "Conversion failed" ; exit ; }
echo "Setting quality of $1 to $q%"
rm "$1"
mv $a.jpg "$1"
rm $a
