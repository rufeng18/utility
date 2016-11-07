#!/bin/bash
DELDIR=$1
CMPTIME=$2
TIMELEN=`echo "$CMPTIME"|wc -c`

for file in `ls $DELDIR`
do
    file="$DELDIR"/"$file"
        ctime=`stat $file -c "%y"`
    #echo $ctime
    tx=${ctime:0:($TIMELEN-1)} 
    #echo $tx
        #if [ "$CMPTIME" = "${ctime:0:($TIMELEN-1)}" ]
        if [[ "$CMPTIME" > "$tx" ]]
        then
        echo "rm -f $file"
                rm -f $file
        fi
done