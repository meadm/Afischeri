#!/bin/bash
while read ALLERGEN; do
    ALLERGENXP=$(grep -w "$ALLERGEN" /Users/MattMead/Documents/Work/Resources/Afumi/NCBI/Afumi_proteins.txt | cut -f11,11)
    IDENTITY=$(grep -w "$ALLERGENXP" /Users/MattMead/Documents/Work/Collaborations/Nick\ Oberlies/conserved\ clusters/With\ Abigail\'s\ Afumi\ Clusters/Afisc_Afum_RBBH.txt | cut -f3,3)
    FISCXP=$(grep -w "$ALLERGENXP" /Users/MattMead/Documents/Work/Collaborations/Nick\ Oberlies/conserved\ clusters/With\ Abigail\'s\ Afumi\ Clusters/Afisc_Afum_RBBH.txt | cut -f1,1)
    FISCID=$(grep -w "$FISCXP" /Users/MattMead/Documents/Work/Resources/Afisc/Afisc_ProteinTable500_29450.txt | cut -f7,7)
    FUMIINFO=$(grep "$ALLERGEN" /Users/MattMead/Documents/Work/Collaborations/Nick\ Oberlies/allergen\ and\ virulence\ factor\ conservation/Afumi\ Allergens\ -\ Table\ S2\ Kjaerbolling\ et\ al\ 2018_MEM\ edited.txt | cut -f1-2)
    echo $FUMIINFO $ALLERGENXP $FISCID $FISCXP $IDENTITY >> Afumi_allergens_fischeri.txt
done < Afumi_allergens_ids.txt
