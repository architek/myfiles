#modules_graph creates a graph of a modules.dep file using dot and ImageMagick
#!/bin/sh

#Check graphiz and ImageMagick are present. You may change ImageMagick to gv for example
type dot > /dev/null && { type display > /dev/null || { echo "ImageMagick is missing";  exit; } ; } || { echo "Graphviz(dot) is missing" ; exit ; } 

#User supplied or current one
depfile=${1:-/lib/modules/$(uname -r)/modules.dep}
[ -r $depfile ] || { echo "$depfile not readable"; exit; }

#Sort modules.dep
sdepfile=$(mktemp -t $(basename $0).XXXXXX)
[ $? == 0 ] || { echo "Could not create temp file $sdepfile" ; exit ; }
sort $depfile > $sdepfile

#We want to remove the prefix /lib/modules/`uname -r`/kernel/
# "kernel" is 6 bytes , "modules.dep" is 11, so substract 6 counting the leading /
subs=$(( $(echo $depfile | wc -c) - 4))

gawk -F":| " -v subs=$subs \
'BEGIN	{
	print "digraph modules { mclimit=2.0;"
	}
/^[^#]/	{
	if (NF==2 ) {		
		print "\"" substr($1,subs) "\"" ";" ;	
		next;
	}
	for(i=3;i<=NF;i++)
		print "\"" substr($1,subs) "\"" "->" "\"" substr($i,subs) "\";" ;
	}
END	{
		print "}"
	}
' $sdepfile | dot -Tps -Nfontsize=10 | display 
rm $sdepfile