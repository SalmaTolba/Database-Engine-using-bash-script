#! /bin/bash

#check if there is no tables in database 

if [ `ls ./database/$dbname | wc -l` == 0 ]
then
      echo -e "================================================================="
      echo -e "${Red}No Table Found${clear}"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      

echo -e "${BPurple}===============Select Table===============${clear}\n"

read -p "Enter Table You Want To Select : " tablename

while [[ -z $tablename ]]
do 
  echo -e "${Red}Invalid Input${clear}🤡"
  read -p "PLease Enter Table Name Again:🧐" tablename
done

export tablename

if [ -f ./database/$dbname/$tablename ]
then
    select choice in "Select All Records" "Select Record" "Select Column" "Back To Table Menu"
    do
      case $REPLY in
        1) source ./SelectAllRecords.sh ;;
        2) source ./SelectRecord.sh ;;
        3) source ./SelectColumn.sh ;;
        4) source ./Connect-Menu.sh ;;
        *) echo -e "${Red}invalid option${clear}" ;; 
      esac
    done
else
    echo -e "${Red}Table Not Exists${clear}"
    echo -e "================================================================="
    source ./SelectIntoTable.sh
fi	
