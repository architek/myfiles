#!/bin/bash
[[ $1 == -h ]] && { echo "
# usage:
# ./script <regexp> will display a summary of packages status with line containing <regexp>
# ./script will display packages status of the current day
#
# examples:
# ./script 2007-04-13 lists changed package statuses on this day
# ./script locales lists changes on package locales
# ./script 2007-04-12.*upgrade lists only upgraded packages on the day before
# ./script ^2007|less -R list the history of the year
" ; exit ; }
pattern=${1:-`date +%Y-%m-%d`}
for i in `ls -1tr /var/log/dpkg.log*` ; do (
    zcat -f $i | egrep $pattern | \
    awk ' BEGIN { RED=31; GREEN=33 ; BLUE= 34 }
    { f1=" "; f2=" "; f3=" "; }
    /upgrade\ / { stat=" U" ; col=GREEN; f1=$4; f2=$5; f3=$6; }
    /not-installed\ / { stat="- D" ; col=RED ; f1=$5 }
    /config-files\ / { stat="- C" ; col=RED ; f1=$5; f2=$6 }
    / install.*</ { stat="+ I"; col=BLUE ; f1=$4; f3=$6 }
    {
        if (f1!=" ") printf("%s %s: \033[0;%dm%s\033[0m %*s %*s %*s\n",$1,$2,col,stat,30,f1,40,f2,40,f3);
    }
    ' | uniq
    )
    done
