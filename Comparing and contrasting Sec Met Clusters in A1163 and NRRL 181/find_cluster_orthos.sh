#!/bin/bash
#$1 is a file that contains all cluster proteins from the species of interest
#$2 is the species of interest
#$3 is the other species
#$4 is the RBBH file
#$5 is the directory where you want the output
#$6 is the other species cluster gene file
while read LINE; do
    if grep -q -w "$LINE" "$4"; then
        ORTHO=$(grep -w "$LINE" "$4" | cut -f2,2)
        if grep -q -w "$ORTHO" "$6"; then
            CLUSTER=$(grep -w "$ORTHO" "$6")
            echo $LINE $CLUSTER >> ${5}/${2}_cluster_orthos_${3}.txt
        else
            echo $LINE $ORTHO NOT_IN_CLUSTER >> ${5}/${2}_cluster_orthos_${3}.txt
        fi
    else
        echo $LINE >> ${5}/${2}_cluster_orthos_${3}.txt
    fi
done < $1
