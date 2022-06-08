#! /bin/bash


if [ `ls ./database/$dbname | wc -l` == 0 ]
then
      echo -e "================================================================="
      echo -e "${Red}No Table Found${clear}"
      echo -e "================================================================="
      source ./Connect-Menu.sh
fi      

echo -e "${BPurples}===============Drop Tables===============${clear}\n"

read -p "Which Table do you want to drop?🤔" tbname
while [[ ! -f ./database/$dbname/$tbname ]] || [[ -z $tbname ]]
  do
      echo -e "${Red}Invalid Input${clear}"
      read -p "please enter valid Table name:🙄" tbname
     
done
while [[ -f ./database/$dbname/$tbname ]]
do   
     read -p "Are you sure? [y/N] 😯" response
      case "$response" in
        [yY]) 
            rm ./database/$dbname/$tbname 
            rm ./database/$dbname/$tbname.Type
            echo -e "${BYellow}Table Deleted successfully${clear}😎"
            echo -e "================================================================="
            source ./Connect-Menu.sh
            ;;
          
        [Nn])
            echo -e "${BCyan}Table Not Deleted${clear}"
            echo -e "================================================================="
            source ./Connect-Menu.sh
          ;;
        *)  
            echo -e "${Red}Invalid Input${clear}"
            echo -e "================================================================="
            source ./DropTable.sh
            ;;
       esac 
done







