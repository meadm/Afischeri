#!/bin/bash
CLUSTER_NUMBER=1
while read LINE; do
    echo CLUSTER_${CLUSTER_NUMBER} >> $2
    echo "$LINE" | cut -f4,4 | tr ';' '\n' >> $2
    let CLUSTER_NUMBER=CLUSTER_NUMBER+1
done < $1
