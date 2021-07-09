#!/bin/bash
#1 is the list of cluster genes in proper order
while read LINE; do
    CLUSTERCHECK=$(echo $LINE | cut -c1)
    if [ "$CLUSTERCHECK" == "C" ]; then
        echo chr - fumigatus_${CLUSTERNUMBER} $CLUSTERNUMBER 0 $CLUSTERCOUNT grey >> test.txt
        CLUSTERNUMBER=$(echo $LINE | cut -d '_' -f2,2)
        CLUSTERCOUNT=0
    else
        let CLUSTERCOUNT=CLUSTERCOUNT+1
    fi
done < "$1"
