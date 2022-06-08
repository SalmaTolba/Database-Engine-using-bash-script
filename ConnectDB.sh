#! /bin/bash

if [ `ls ./database/ | wc -l` == 0 ]
then
      echo -e "${Red}No Database Found${clear}"
      echo -e "================================================================="
      source ./Main_menu.sh
fi      

echo -e "${BBlue}===============Connect Database===============${clear}\n"
read -p "Please Enter Database You Want To Connect: " dbname
export dbname
if [[ ! -d ./database/$dbname ]] || [[ -z $dbname ]]
then  
      echo -e "${Red}$dbname Database Not Exists Create new one${clear}"
      echo -e "================================================================="
      source ./Main_menu.sh
else
      echo -e "                ${BYellow}Database Exists${clear}                "
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi

 
