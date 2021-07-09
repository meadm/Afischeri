#!/bin/bash
while read LINE; do
    XP=$(echo $LINE | cut -d ' ' -f1,1)
    grep "$XP" /Users/MattMead/Documents/Work/Resources/Afisc/Afisc_ProteinTable500_29450.txt | cut -f7,7 >> Shared_Afisc.txt
done <Afisc_Afum_RBBH.txt
