#! /bin/bash

echo -e "${BBlue}===============Databases===============${clear}"
if [ `ls ./database/ | wc -l` == 0 ]
then     
    echo -e "${Red}No Database Found😶${clear}" 
    echo -e "=================================================================" 
    source ./Main_menu.sh
else
            ls ./database/
            echo -e "================================================================="
            source ./Main_menu.sh
fi

