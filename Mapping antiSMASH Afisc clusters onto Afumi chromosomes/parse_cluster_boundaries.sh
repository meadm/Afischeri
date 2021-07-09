#!/bin/bash
while read LINE; do
     LEFTID=$(echo $LINE | cut -d ' ' -f1,1)
     RIGHTID=$(echo $LINE | cut -d ' ' -f2,2)
     CHROMOSOME=$(grep "$LEFTID" afu_clusters-left_FungiDB.txt | cut -f3,3 | cut -d ':' -f1,1)
     LEFTNUMBER=$(grep "$LEFTID" afu_clusters-left_FungiDB.txt | cut -d ':' -f2,2 | cut -d '.' -f1,1 | sed 's/,//g')
     RIGHTNUMBER=$(grep "$RIGHTID" afu_clusters-right_FungiDB.txt | cut -d '.' -f3,3 | sed 's/,//g' | cut -d '(' -f1,1)
     echo $LEFTID $RIGHTID $CHROMOSOME $LEFTNUMBER $RIGHTNUMBER | tr ' ' '\t' >> afu_clusters_location.txt
done <afu_clusters.txt
