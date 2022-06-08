#! /bin/bash

echo -e "${BPurples}===============Tables===============${clear}\n"
if [ `ls ./database/$dbname/ | wc -l` == 0 ]
then     
    echo -e "${Red}No Table Found${clear}😶"
    echo -e "=================================================================" 
    source ./Connect-Menu.sh   
else
    ls ./database/$dbname
    echo -e "================================================================="
    source ./Connect-Menu.sh
fi

