#!/bin/bash
while read LINE; do
    XP=$(echo $LINE | cut -d ' ' -f11,11)
    if grep -q -w "$XP" Afisc_Afum_RBBH.txt; then
        echo $XP >> test.txt
    else
        echo $XP >> uniqueAfumi.txt
    fi
done < /Users/MattMead/Documents/Work/Resources/Afumi/NCBI/Afumi_proteins.txt
